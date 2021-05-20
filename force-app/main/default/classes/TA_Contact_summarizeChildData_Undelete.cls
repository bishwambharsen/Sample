public class TA_Contact_summarizeChildData_Undelete implements TriggerAction.AfterUndelete {
  public void afterUndelete(List<Contact> newList) {
    TriggerUtil.summariseChildData(newList);
  }
}
