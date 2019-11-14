from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.forms import model_to_dict
from django.views.decorators.csrf import csrf_exempt
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from exam.models import Student, Result, Exam
from exam import constants
from django.db.models import Sum, Avg

class StudentAPIs(APIView):
    @csrf_exempt
    def get(self, request):
        students = Student.objects.all()
        student_list = []
        for instance in students:
            student_list.append(model_to_dict(instance))

        response_data = {
            "Student": student_list
        }
        response = Response(response_data, status=status.HTTP_200_OK)
        return response


class AllAvailableUrls(APIView):
    @csrf_exempt
    def get(self, request):
        msg = {
            "GET /ratings/": "Ranking for all students by standard and term",
            "GET /overall/top/students/standard/": "Overall top 5 by standard and term",
            "GET /top/students/subjects/": "Top 5 by subjects and term",
            "GET /bottom/students/standard/": "Bottom 20 students by standard and term",
            "GET /average/overall/": "Average of all 4 terms by subjects and overall",
            "GET /students/": "All students profiles"
        }
        response = Response(msg, status=status.HTTP_200_OK)
        return response


# Ranking for all students by standard and term
class RatingOfStudents(APIView):
    @csrf_exempt
    def get(self, request):
        standard_list = list(dict.fromkeys([x.standard for x in Student.objects.all()]))
        result_dict = {}
        for standard in standard_list:
            standard_dict = {}
            for term in range(1, constants.TERMS+1):
                term_dict = {}
                result_obj = Result.objects.filter(studentFK__standard=standard, terms=term).values('studentFK__name').annotate(Avg('gained_marks'))
                per_term_result_list = sorted(result_obj, key=lambda k: k['gained_marks__avg'], reverse=True)
                count = 1
                for student_term_result in per_term_result_list:
                    term_dict['Rank '+str(count)] = student_term_result
                    count = count+1
                standard_dict['Term '+ str(term)] = term_dict
            result_dict['Standard ' + str(standard)] = standard_dict

        response = Response(result_dict, status=status.HTTP_200_OK)
        return response


# Overall top 5 by standard and term
class OverallTopStudentsBasedOnStandardTerm(APIView):
    @csrf_exempt
    def get(self, request):
        standard_list = list(dict.fromkeys([x.standard for x in Student.objects.all()]))
        subject_percentage = {}
        for i in Exam.objects.all():
            subject_percentage[i.subject] = i.percentage
        result_dict = {}
        for standard in standard_list:
            standard_dict = {}
            for term in range(1, constants.TERMS+1):
                result_obj = Result.objects.filter(studentFK__standard=standard, terms=term)#.values('studentFK__name').annotate(Avg('gained_marks'))
                dic = {}
                for instance in result_obj:
                    considered_marks = (instance.gained_marks * subject_percentage[instance.examFK.subject] ) / 100
                    if instance.studentFK in dic:
                        dic[instance.studentFK] =  dic[instance.studentFK] + considered_marks
                    else:
                        dic[instance.studentFK] = considered_marks

                overall_ranking = sorted(dic.items(), key=lambda kv: kv[1], reverse=True)
                term_dict = {}
                count = 1
                for student_term_result in overall_ranking:
                    term_dict['Rank '+str(count)] = {
                        "student_name": student_term_result[0].name,
                        "overall_marks": int(student_term_result[1])
                    }
                    count = count+1
                    if count > 5:
                        break
                standard_dict['Term '+ str(term)] = term_dict
            result_dict['Standard ' + str(standard)] = standard_dict

        response = Response(result_dict, status=status.HTTP_200_OK)
        return response


# Top 5 by subjects and term
class TopStudentsBasedOnSubjectTerm(APIView):
    @csrf_exempt
    def get(self, request):
        subject_list = list(dict.fromkeys([x.subject for x in Exam.objects.all()]))
        result_dict = {}
        for subject in subject_list:
            standard_dict = {}
            for term in range(1, constants.TERMS+1):
                term_dict = {}
                result_obj = Result.objects.filter(examFK__subject=subject, terms=term).values('studentFK__name').annotate(Avg('gained_marks'))
                per_term_result_list = sorted(result_obj, key=lambda k: k['gained_marks__avg'], reverse=True)
                count = 1
                for student_term_result in per_term_result_list:
                    term_dict['Rank '+str(count)] = student_term_result
                    count = count+1
                    if count > 5:
                        break
                standard_dict['Term '+ str(term)] = term_dict
            result_dict[str(subject)] = standard_dict

        response = Response(result_dict, status=status.HTTP_200_OK)
        return response


# Bottom 20 students by standard and term
class BottomStudentsBasedOnStandardTerm(APIView):
    @csrf_exempt
    def get(self, request):
        standard_list = list(dict.fromkeys([x.standard for x in Student.objects.all()]))
        result_dict = {}
        for standard in standard_list:
            standard_dict = {}
            for term in range(1, constants.TERMS+1):
                term_dict = {}
                result_obj = Result.objects.filter(studentFK__standard=standard, terms=term).values('studentFK__name').annotate(Avg('gained_marks'))
                per_term_result_list = sorted(result_obj, key=lambda k: k['gained_marks__avg'], reverse=True)
                count = 1
                for student_term_result in per_term_result_list:
                    term_dict['Rank '+str(count)] = student_term_result
                    count = count+1
                    if count > 20:
                        break
                standard_dict['Term '+ str(term)] = term_dict
            result_dict['Standard ' + str(standard)] = standard_dict


        response = Response(result_dict, status=status.HTTP_200_OK)
        return response


# Average of all 4 terms by subjects and overall
class Average(APIView):
    @csrf_exempt
    def get(self, request):
        subject_list = list(dict.fromkeys([x.subject for x in Exam.objects.all()]))
        subject_percentage = {}
        for i in Exam.objects.all():
            subject_percentage[i.subject] = i.percentage
        result_dict = {}

        for subject in subject_list:
            subject_dict = {}
            for term in range(1, constants.TERMS + 1):
                result_obj = Result.objects.filter(examFK__subject=subject, terms=term)
                average_marks = 0
                count = 0
                for instance in result_obj:
                    considered_marks = (instance.gained_marks * subject_percentage[instance.examFK.subject]) / 100
                    average_marks = average_marks + considered_marks
                    count = count + 1
                if count != 0:
                    average_marks = average_marks / count

                subject_dict['Term ' + str(term)] = average_marks
            result_dict[str(subject)] = subject_dict

        response = Response(result_dict, status=status.HTTP_200_OK)
        return response
