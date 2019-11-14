from django.conf.urls import include, url
from django.contrib import admin
from exam import views

urlpatterns = [
    url(r'^$', views.AllAvailableUrls.as_view()),
    url(r'^students/$', views.StudentAPIs.as_view()),
    url(r'^ratings/$', views.RatingOfStudents.as_view()),
    url(r'^overall/top/students/standard/$', views.OverallTopStudentsBasedOnStandardTerm.as_view()),
    url(r'^top/students/subjects/$', views.TopStudentsBasedOnSubjectTerm.as_view()),
    url(r'^bottom/students/standard/$', views.BottomStudentsBasedOnStandardTerm.as_view()),
    url(r'^average/overall/$',views.Average.as_view()),

    url(r'^admin/', include(admin.site.urls)),
]
