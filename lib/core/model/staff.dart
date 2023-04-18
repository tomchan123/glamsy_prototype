enum StaffType {
  exprienced,
  senior,
  junior
}

class Staff {
  String name;
  int waitTime;
  int hoursWorked;
  int rating;
  String positionTitle;
  StaffType staffType;
  String imageDir;

  Staff(
    this.name,
    this.waitTime,
    this.hoursWorked,
    this.rating,
    this.positionTitle,
    this.staffType,
    this.imageDir,
  );

  String get biography { 
    return "$name在美容中心擔任$positionTitle工作已有10年的時間。"
    " 對美容行業充滿熱情的$name，在各種美容治療和服務方面積累了豐富的經驗和知識，包括。";
  }

  static List<Staff> getAllStaffs() {
    return [
      Staff("陳大文", 0, 3116, 2, "高級美容師", 
        StaffType.senior, "assets/images/staff/staff1.jpg"),
      Staff("黃小強", 14, 4973, 3, "資深美容師",
        StaffType.exprienced, "assets/images/staff/staff2.jpg"),
      Staff("林梓萱", 42, 2847, 1, "高級美容師", 
        StaffType.senior, "assets/images/staff/staff3.jpg"),
      Staff("張思潔", 56, 3219, 5, "高級美容師",
        StaffType.senior, "assets/images/staff/staff4.jpg"),
    ];
  }
}