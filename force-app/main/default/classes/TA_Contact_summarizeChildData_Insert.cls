public class TA_Contact_summarizeChildData_Insert implements TriggerAction.AfterInsert {
  public void afterInsert(List<Contact> newList) {
    TriggerUtil.summariseChildData(newList);
  }
}
