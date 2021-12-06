/// id : 6
/// email : "1558053958@qq.com"
/// name : ""
/// mobile : ""
/// avatar_url : "http://101.200.174.126:10000/data_cloud_system/users/avatars/6/medium/RackMultipart20191223-28128-1vv84sr.jpg?1577080231"

// var student =
//     '{"account":"230101201001011234","bizId":1,"bizName":"staff","remarks":"555","schoolId":1,"staffId":8,"staffName":"test333","staffPwd":"1234","sts":0,"stsTime":1595920197000,"userId":8,"userName":"学生8","userinfo":{"enroll_id":2,"gender":16,"modify_time":1622641616393,"class_id":22,"gender_code":"1","enroll_year_name":"2019年","student_name":"学生8","sts_time":1622641616393,"school_id":1,"course_group_name":" 历史+化学+政治","course_ids":"5,9,8","student_id":8,"school_name":"测试学校一","gender_name":"男","enroll_year":39,"sts":1,"course_group_id":15,"grade_name":"高二年级"}}';

// var teacher =
//     '{"account":"teacher","bizId":3,"bizName":"teacher","schoolId":1,"staffId":3,"staffName":"","staffPwd":"123","sts":0,"stsTime":1595770999000,"userId":3,"userName":"张三丰","userinfo":{"courses":"{\"1\":\"语文\"}","teacher_name":"张三丰","gender":0,"teacher_id":3,"school_name":"测试学校一","title":0,"teacher_code":"003","school_id":1,"user_id":3,"remarks":""}}';

class User {
  // int? id;
  // String? name;
  // String? account;
  // int? bizId;

  // int? schoolId;
  // String? schoolName;

  // int? classId;
  // int? studentId;

  /// 用户信息
  String account = '';
  String nickName = 'nickName';
  String avatar = '';
  int gender = 0;

  User(
      {this.account,
      this.nickName,
      this.account,
      this.avatar,
      this.gender,
);

  static User? fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return null;

    User userBean = User();
    userBean.id = map['id'];
    userBean.name = map['name'];
    userBean.account = map['account'];
    userBean.bizId = map['bizId'];
    userBean.schoolId = map['schoolId'];
    userBean.schoolName = map['schoolName'];

    Map userInfo = map['userinfo'];

    userBean.classId = userInfo['class_id'] == null ? "" : userInfo['class_id'];
    userBean.studentId =
        userInfo['student_id'] == null ? "" : userInfo['student_id'];

    return userBean;
  }

  Map toJson() => {
        "id": id,
        "name": name,
        "account": account,
        "bizId": bizId,
        "schoolId": schoolId,
        "schoolName": schoolName,
        "classId": classId,
        "studentId": studentId,
      };
}
