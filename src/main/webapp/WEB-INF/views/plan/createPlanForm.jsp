<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
  <div class="plan_container">
    <!-- 새 일정 생성 패널 -->
    <div id="planCreatePanel" class="panel" style="display: block; left: 60%;" data-panel-group="panel">
      <h3>새 일정 생성</h3>
      <form id="planCreateForm" method="post" action="createPlan">
        <label>날짜</label>
        <input type="text" name="datefilter" value=""/><br/>
        <div class="planButton">
          <button type="button" style="background-color: #2e8b57; color: #fff" onclick="roadNewPlan(this.form, event)">생성</button>
        </div>
      </form>
    </div>
  </div>
<%@ include file="../footer.jsp" %>
