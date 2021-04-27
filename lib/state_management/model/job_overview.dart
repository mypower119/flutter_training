// To parse this JSON data, do
//
//     final jobListResponse = jobListResponseFromJson(jsonString);

import 'dart:convert';

JobListResponse jobListResponseFromJson(String str) => JobListResponse.fromJson(json.decode(str));

String jobListResponseToJson(JobListResponse data) => json.encode(data.toJson());

class JobListResponse {
  JobListResponse({
    this.title,
    required this.recCampaingn,
  });

  String? title;
  List<JobDetailOverview> recCampaingn;

  factory JobListResponse.fromJson(Map<String, dynamic> json) => JobListResponse(
    title: json["title"],
    recCampaingn: List<JobDetailOverview>.from(json["rec_campaingn"].map((x) => JobDetailOverview.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "rec_campaingn": List<dynamic>.from(recCampaingn.map((x) => x.toJson())),
  };
}

class JobDetailOverview {
  JobDetailOverview({
    this.cpId,
    this.campaignCode,
    this.campaignName,
    this.cpProposal,
    this.cpPosition,
    this.cpDepartment,
    this.cpAmountRecruiment,
    this.cpFormWork,
    this.cpWorkplace,
    this.cpSalaryFrom,
    this.cpSalaryTo,
    this.cpFromDate,
    this.cpToDate,
    this.cpReasonRecruitment,
    this.cpJobDescription,
    this.cpManager,
    this.cpFollower,
    this.cpAgesFrom,
    this.cpAgesTo,
    this.cpGender,
    this.cpHeight,
    this.cpWeight,
    this.cpLiteracy,
    this.cpExperience,
    this.cpAddFrom,
    this.cpDateAdd,
    this.cpStatus,
    this.displaySalary,
    this.recChannelFormId,
    this.companyId,
    this.positionId,
    this.positionName,
    this.positionDescription,
    this.industryId,
    this.jobSkill,
    this.id,
    this.companyName,
    this.companyDescription,
    this.companyAddress,
    this.companyIndustry,
    this.industryName,
    this.industryDescription,
    this.companyLogo,
    this.altLogo,
  });

  String? cpId;
  String? campaignCode;
  String? campaignName;
  dynamic cpProposal;
  String? cpPosition;
  String? cpDepartment;
  String? cpAmountRecruiment;
  String? cpFormWork;
  String? cpWorkplace;
  String? cpSalaryFrom;
  String? cpSalaryTo;
  DateTime? cpFromDate;
  DateTime? cpToDate;
  String? cpReasonRecruitment;
  String? cpJobDescription;
  String? cpManager;
  String? cpFollower;
  String? cpAgesFrom;
  String? cpAgesTo;
  String? cpGender;
  String? cpHeight;
  String? cpWeight;
  String? cpLiteracy;
  String? cpExperience;
  String? cpAddFrom;
  DateTime? cpDateAdd;
  String? cpStatus;
  String? displaySalary;
  String? recChannelFormId;
  String? companyId;
  String? positionId;
  String? positionName;
  String? positionDescription;
  String? industryId;
  String? jobSkill;
  dynamic id;
  String? companyName;
  dynamic companyDescription;
  String? companyAddress;
  String? companyIndustry;
  dynamic? industryName;
  dynamic? industryDescription;
  String? companyLogo;
  String? altLogo;

  factory JobDetailOverview.fromJson(Map<String, dynamic> json) => JobDetailOverview(
    cpId: json["cp_id"],
    campaignCode: json["campaign_code"],
    campaignName: json["campaign_name"],
    cpProposal: json["cp_proposal"],
    cpPosition: json["cp_position"],
    cpDepartment: json["cp_department"],
    cpAmountRecruiment: json["cp_amount_recruiment"],
    cpFormWork: json["cp_form_work"],
    cpWorkplace: json["cp_workplace"],
    cpSalaryFrom: json["cp_salary_from"],
    cpSalaryTo: json["cp_salary_to"],
    cpFromDate: json["cp_from_date"] == null ? null : DateTime.parse(json["cp_from_date"]),
    cpToDate: DateTime.parse(json["cp_to_date"]),
    cpReasonRecruitment: json["cp_reason_recruitment"],
    cpJobDescription: json["cp_job_description"],
    cpManager: json["cp_manager"] == null ? null : json["cp_manager"],
    cpFollower: json["cp_follower"] == null ? null : json["cp_follower"],
    cpAgesFrom: json["cp_ages_from"],
    cpAgesTo: json["cp_ages_to"],
    cpGender: json["cp_gender"],
    cpHeight: json["cp_height"],
    cpWeight: json["cp_weight"],
    cpLiteracy: json["cp_literacy"],
    cpExperience: json["cp_experience"],
    cpAddFrom: json["cp_add_from"],
    cpDateAdd: DateTime.parse(json["cp_date_add"]),
    cpStatus: json["cp_status"],
    displaySalary: json["display_salary"],
    recChannelFormId: json["rec_channel_form_id"],
    companyId: json["company_id"],
    positionId: json["position_id"],
    positionName: json["position_name"],
    positionDescription: json["position_description"],
    industryId: json["industry_id"],
    jobSkill: json["job_skill"],
    id: json["id"],
    companyName: json["company_name"],
    companyDescription: json["company_description"],
    companyAddress: json["company_address"],
    companyIndustry: json["company_industry"],
    industryName: json["industry_name"],
    industryDescription: json["industry_description"],
    companyLogo: json["company_logo"] != null ? 'https://nhankiet-stage.inapps.technology/${json["company_logo"]}': null,
    altLogo: json["alt_logo"],
  );

  Map<String, dynamic> toJson() => {
    "cp_id": cpId,
    "campaign_code": campaignCode,
    "campaign_name": campaignName,
    "cp_proposal": cpProposal,
    "cp_position": cpPosition,
    "cp_department": cpDepartment,
    "cp_amount_recruiment": cpAmountRecruiment,
    "cp_form_work": cpFormWork,
    "cp_workplace": cpWorkplace,
    "cp_salary_from": cpSalaryFrom,
    "cp_salary_to": cpSalaryTo,
    "cp_from_date": cpFromDate == null ? null : "${cpFromDate!.year.toString().padLeft(4, '0')}-${cpFromDate!.month.toString().padLeft(2, '0')}-${cpFromDate!.day.toString().padLeft(2, '0')}",
    "cp_to_date": "${cpToDate!.year.toString().padLeft(4, '0')}-${cpToDate!.month.toString().padLeft(2, '0')}-${cpToDate!.day.toString().padLeft(2, '0')}",
    "cp_reason_recruitment": cpReasonRecruitment,
    "cp_job_description": cpJobDescription,
    "cp_manager": cpManager == null ? null : cpManager,
    "cp_follower": cpFollower == null ? null : cpFollower,
    "cp_ages_from": cpAgesFrom,
    "cp_ages_to": cpAgesTo,
    "cp_gender": cpGender,
    "cp_height": cpHeight,
    "cp_weight": cpWeight,
    "cp_literacy": cpLiteracy,
    "cp_experience": cpExperience,
    "cp_add_from": cpAddFrom,
    "cp_date_add": "${cpDateAdd!.year.toString().padLeft(4, '0')}-${cpDateAdd!.month.toString().padLeft(2, '0')}-${cpDateAdd!.day.toString().padLeft(2, '0')}",
    "cp_status": cpStatus,
    "display_salary": displaySalary,
    "rec_channel_form_id": recChannelFormId,
    "company_id": companyId,
    "position_id": positionId,
    "position_name": positionName,
    "position_description": positionDescription,
    "industry_id": industryId,
    "job_skill": jobSkill,
    "id": id,
    "company_name": companyName,
    "company_description": companyDescription,
    "company_address": companyAddress,
    "company_industry": companyIndustry,
    "industry_name": industryName,
    "industry_description": industryDescription,
    "company_logo": companyLogo,
    "alt_logo": altLogo,
  };
}
