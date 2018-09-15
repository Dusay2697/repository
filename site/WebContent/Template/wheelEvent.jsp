<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
<!-- jQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Winwheel.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/TweenMax.min.js"></script>
<link rel="stylesheet" href="wheelEvent.css" />
<title>wheelEvent.jsp</title>
<link rel="stylesheet" type="text/css" href="toto.css">
</head>
<body>
<%--�α��� ���� ���� �޴� --%>
<jsp:include page="topMenu.jsp"/> 
 <%--���� �޴�--%>
<table width="1600"  align="center">
 <tr id="menu" >
  <td align="left" width="100%">
   <a class="sub" id="site" href="siteInfo">����Ʈ �Ұ�</a>
   <a class="sub" id="club" href="clubMall">Ŭ����</a>
   <a class="sub" id="view" href="groupViewing">��ü ����</a>
   <a class="sub" id="sale" href="sale">Ư�� ����</a>
    <a class="sub" id="event" href="event">�̺�Ʈ</a>
  </td>
 </tr>
</table>

 <%--���̵� �޴�--%>
<ul class="left_menu"> 
<li>�̺�Ʈ</li> 
<li>�̴ϰ��� 
<ul class="lm_sub"> 
<li> 
<a href="toto.jsp">����� ����</a>
<br><a href="wheelEvent.jsp">�귿�� ������!</a> 
</li> 
</ul> 
</li> 
</ul> 

 <%--�귿 ȭ�� ����--%>
<div class="example_wheel">
        <table cellpadding="10" cellspacing="0" style="margin-left: auto; margin-right: auto;">
        	<tr>
        		<td colspan="2" align="center"><p style="font-size: 19px; color: rgb(28, 32, 95); font-weight: bold;">100% ��÷�Ǵ� ����� �귿�� �����ּ���~!!</p></td>
        	</tr>
            <tr>
                <td width="438" height="582" class="the_wheel" align="center" valign="center">
                    <canvas id="canvas" width="434" height="434">
                        <p style="{color: white}" align="center">Sorry, your browser doesn't support canvas. Please try another.</p>
                    </canvas>
                </td>
            </tr>
            <tr>
            	<td colspan="2" height="150"><h2 style="float: left;">�Ϸ翡 �ѹ� ����� ���� �� �ֽ��ϴ�. </br> �߰��� ������ ���� 50����Ʈ�� �����˴ϴ�.</h2>
            		<div id="spin_button" style="display: inline-block; width:150px; font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.5em; border-top-left-radius: 4px; border-top-right-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; background-color: rgb(52, 152, 219);" onClick="startSpin();" >�귿������</div>
            		<a href="#" onClick="resetWheel(); return false;">Play Again</a><br />
            	</td> 
            </tr>
        </table>
    </div>
    <script>
        var theWheel = new Winwheel({
            'numSegments'  : 13,         // Number of segments
            'outerRadius'  : 212,       // The size of the wheel.
            'centerX'      : 217,       // Used to position on the background correctly.
            'centerY'      : 219,
            'textFontSize' : 12,        // Font size.
            'segments'     :            // Definition of all the segments.
            [
               {'fillStyle' : '#ddd', 'text' : '��ü���� 1�� �ݰ�'},
               {'fillStyle' : '#ddd', 'text' : '��۹���'},
               {'fillStyle' : '#ddd', 'text' : '5���� Ŭ���� ��ǰ��'},
               {'fillStyle' : '#ddd', 'text' : '150����Ʈ'},
               {'fillStyle' : '#ddd', 'text' : '50����Ʈ'},
               {'fillStyle' : '#ddd', 'text' : '200����Ʈ'},
               {'fillStyle' : '#ddd', 'text' : '100����Ʈ'},
               {'fillStyle' : '#ddd', 'text' : '400����Ʈ'},
               {'fillStyle' : '#ddd', 'text' : '30% ���α�'},
               {'fillStyle' : '#ddd', 'text' : '50����Ʈ'},
               {'fillStyle' : '#ddd', 'text' : '������ 1�� ������'},
               {'fillStyle' : '#ddd', 'text' : '100����Ʈ'},
               {'fillStyle' : '#ddd	', 'text' : '200����Ʈ'}         
            ],
            'animation' :               // Definition of the animation
            {
                'type'     : 'spinToStop',
                'duration' : 5,
                'spins'    : 8,
                'callbackFinished' : alertPrize
            }
        });

     // Vars used by the code in this page to do power controls.
        var wheelPower    = 0;
        var wheelSpinning = false;

        // -------------------------------------------------------
        // Function to handle the onClick on the power buttons.
        // -------------------------------------------------------
        function powerSelected(powerLevel)
        {
            // Ensure that power can't be changed while wheel is spinning.
            if (wheelSpinning == false)
            {

                // Set wheelPower var used when spin button is clicked.
                wheelPower = powerLevel;
                // Light up the spin button by changing it's source image and adding a clickable class to it.
                document.getElementById('spin_button').src = "http://dougtesting.net//elements/images/examples/spin_on.png";
                document.getElementById('spin_button').className = "clickable";
            }
        }

        // -------------------------------------------------------
        // Click handler for spin button.
        // -------------------------------------------------------
        function startSpin()
        {
            // Ensure that spinning can't be clicked again while already running.
            if (wheelSpinning == false)
            {
                // Based on the power level selected adjust the number of spins for the wheel, the more times is has
                // to rotate with the duration of the animation the quicker the wheel spins.
                if (wheelPower == 1)
                {
                    theWheel.animation.spins = 3;
                }
                else if (wheelPower == 2)
                {
                    theWheel.animation.spins = 8;
                }
                else if (wheelPower == 3)
                {
                    theWheel.animation.spins = 15;
                }

                // Disable the spin button so can't click again while wheel is spinning.
                document.getElementById('spin_button').src       = "http://dougtesting.net//elements/images/examples/spin_off.png";
                document.getElementById('spin_button').className = "";

                // Begin the spin animation by calling startAnimation on the wheel object.
                theWheel.startAnimation();

                // Set to true so that power can't be changed and spin button re-enabled during
                // the current animation. The user will have to reset before spinning again.
                wheelSpinning = true;
            }
        }

        // -------------------------------------------------------
        // Function for reset button.
        // -------------------------------------------------------
        function resetWheel()
        {
            theWheel.stopAnimation(false);  // Stop the animation, false as param so does not call callback function.
            theWheel.rotationAngle = 0;     // Re-set the wheel angle to 0 degrees.
            theWheel.draw();                // Call draw to render changes to the wheel.


            wheelSpinning = false;          // Reset to false to power buttons and spin can be clicked again.
        }

        // -------------------------------------------------------
        // Called when the spin animation has finished by the callback feature of the wheel because I specified callback in the parameters.
        // -------------------------------------------------------
        
        // Called when the animation has finished.
        function alertPrize(indicatedSegment)
        {
            // Do basic alert of the segment text.
            alert("" + indicatedSegment.text + "�� ��÷�Ǽ̽��ϴ�.!");
        }
    </script>

 
  <%--FOOTER--%>
  <table width="960" align="center">
 <tr>
  <td id="bm" >
   <jsp:include page="bottom.jsp"/>		
  </td>
</tr>
</table>
</body>
</html>