public class TA_Contact_summarizeChildData_Delete implements TriggerAction.AfterDelete {
  public void afterDelete(List<Contact> newList) {
    TriggerUtil.summariseChildData(newList);
  }
}
