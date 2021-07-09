class EndPoint {
  static final String _baseUrl = 'https://medappconception.herokuapp.com/api/';

  ///Auth url's
  static final String registration = _baseUrl + 'registerUser';
  static final String getUser = _baseUrl + 'getUserByType';
  static final String login = _baseUrl + 'login';
  static final String loginEmail = _baseUrl + 'loginEmail';
  static final String updatePassword = _baseUrl + 'updatePassword';
  static final String editProfile = _baseUrl + 'editProfile';
  static final String patientList = _baseUrl + 'patientList';
  static final String forgotPassword = _baseUrl + 'forgotPassword';
  static final String changeDoctor = _baseUrl + 'changeDoctor';
  static final String allAppointment = _baseUrl + 'allAppointments';

  static final String addAppointment = _baseUrl + 'addAppointment';
  static final String doctorCommentAppointment =
      _baseUrl + 'doctorCommentAppointment';
  static final String addNotification = _baseUrl + 'addNotification';
  static final String allNotifications = _baseUrl + 'allNotifications';
  static final String addMedicine = _baseUrl + 'addMedicine';
  static final String allMedications = _baseUrl + 'allMedications';
  static final String deleteMedicine = _baseUrl + 'deleteMedicine';
}
