<%@ include file="includes/header.jsp" %>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float: left; margin-right: 30px;">
        <h2>Contact Us Form</h2>
        <form action="contact-confirmation.jsp" method="post">
          <div>
            <label for="name">Name <span>*</span></label>
            <input type="text" name="name" id="name" value="" size="22" required>
          </div>
          <div>
            <label for="email">Email <span>*</span></label>
            <input type="email" name="email" id="email" value="" size="22" required>
          </div>
          <div>
            <label for="phone">Phone <span>*</span></label>
            <input type="tel" name="phone" id="phone" value="" size="22" required>
          </div>
          <div>
            <label for="subject">Subject <span>*</span></label>
            <input type="text" name="subject" id="subject" value="" size="22" required>
          </div>
          <div>
            <label for="message">Message <span>*</span></label>
            <textarea name="message" id="message" cols="25" rows="5" required></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Submit">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
        </form>
      </div>
      <div style="float: left;">
        <div><img src="images/save_1.jpg" style="width: 250px;"></div><br>
        <div><img src="images/save_2.jpg" style="width: 250px;"></div>
      </div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
