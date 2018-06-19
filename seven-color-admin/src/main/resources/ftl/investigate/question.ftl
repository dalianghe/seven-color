<!DOCTYPE html>
<html>
<head>
    <title>问卷调查</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1,user-scalable=no">
    <meta name="applicable-device" content="mobile"/>
    <link rel="stylesheet" href="${re.contextPath}/static/css/wenjuan.css"/>
    <script src="${re.contextPath}/static/js/jquery.min.js"></script>
    <script src="${re.contextPath}/static/js/hintinfo.js" type="text/javascript"></script>
    <script src="${re.contextPath}/static/js/jqmobo2.js" type="text/javascript"></script>
</head>

<body>
<form id="form2" method="post" action="">
    <div id="toptitle">
        <img src="${re.contextPath}/static/images/wenjuan-head.jpg" alt="">
    </div>
    <div id="divContent" class="divContent">
        <div id="divQuestion">
            <fieldset class='fieldset' style='' id='fieldset1'>
                <div class='field ui-field-contain' id='div1' req='1' topic='1' data-role='fieldcontain' type='3'>
                    <div class='field-label'>1. 性别<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='1' id='q1_1' name='q1' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q1_1'>男</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='2' id='q1_2' name='q1' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q1_2'>女</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div2' req='1' topic='2' data-role='fieldcontain' type='3'>
                    <div class='field-label'>2. 您的年龄段：<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='1' id='q2_1' name='q2' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q2_1'>18岁以下</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='2' id='q2_2' name='q2' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q2_2'>18~25</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='3' id='q2_3' name='q2' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q2_3'>26~30</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='4' id='q2_4' name='q2' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q2_4'>31~40</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='5' id='q2_5' name='q2' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q2_5'>41~50</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='6' id='q2_6' name='q2' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q2_6'>51~60</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='7' id='q2_7' name='q2' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q2_7'>60以上</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div3' req='1' topic='3' data-role='fieldcontain' type='3'>
                    <div class='field-label'>3. 图片里是一包叫做大团结的短支烟，您觉得看起来怎么样？<span class='req'>*</span><img
                            src="images/wenjuan.jpg" alt=""></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='1' id='q3_1' name='q3' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q3_1'>非常好看</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='2' id='q3_2' name='q3' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q3_2'>一般</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='3' id='q3_3' name='q3' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q3_3'>不好看</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div4' req='1' topic='4' style='display:none;' relation='3,3'
                     data-role='fieldcontain' type='1'>
                    <div class='field-label'>4. 您认为它不好看的原因是？<span class='req'>*</span></div>
                    <div class='ui-input-text' style='position:relative;'>
                        <input type='text' id='q4' value='' name='q4'/></div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div5' req='1' topic='5' data-role='fieldcontain' type='3'>
                    <div class='field-label'>5. 您抽烟吗？<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='1' id='q5_1' name='q5' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q5_1'>抽</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='2' id='q5_2' name='q5' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q5_2'>不抽</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div6' req='1' topic='6' style='display:none;' relation='5,2'
                     data-role='fieldcontain' type='3'>
                    <div class='field-label'>6. 在您看来，您觉得大团结更适合在哪个场景里出现？<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='1' id='q6_1' name='q6' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q6_1'>无穷尽的加班TIME</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='2' id='q6_2' name='q6' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q6_2'>来去匆匆的地铁站口</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='3' id='q6_3' name='q6' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q6_3'>斑斓喧嚣的酒吧</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div7' req='1' topic='7' style='display:none;' relation='5,1'
                     data-role='fieldcontain' type='3'>
                    <div class='field-label'>7. 您是否知道或者抽过大团结<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='1' id='q7_1' name='q7' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q7_1'>是</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='2' id='q7_2'  name='q7' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q7_2'>否</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div8' req='1' topic='8' style='display:none;' relation='7,1'
                     data-role='fieldcontain' type='3'>
                    <div class='field-label'>8. 您更愿意在哪种场景里抽大团结呢？<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='无穷尽的加班TIME' id='q8_1' name='q8' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q8_1'>无穷尽的加班TIME</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='来去匆匆的地铁站口' id='q8_2' name='q8' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q8_2'>来去匆匆的地铁站口</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='斑斓喧嚣的酒吧' id='q8_3' name='q8' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q8_3'>斑斓喧嚣的酒吧</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div9' req='1' topic='9' style='display:none;' relation='7,2'
                     data-role='fieldcontain' type='3'>
                    <div class='field-label'>8. 您会在哪种场景里想起这包烟呢？<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='无穷尽的加班TIME' id='q9_1' name='q9' style='display:none;'/>
                            <aclass='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q9_1'>无穷尽的加班TIME</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='来去匆匆的地铁站口' id='q9_2' name='q9' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q9_2'>来去匆匆的地铁站口</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'>
                            <input type='radio' value='斑斓喧嚣的酒吧' id='q9_3' name='q9' style='display:none;'/>
                            <a class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q9_3'>斑斓喧嚣的酒吧</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
            </fieldset>
        </div>
        <div class="footer">
            <div id="divSubmit" style=" display:none;">
                <a id="ctlNext" href="javascript:;" class="button blue" onclick="xuan()">提交</a>
            </div>
        </div>
    </div>
<#--<input type="hidden" value="1" id="action" name="action"/>
<input type="hidden" value="2018/6/12 18:01:36" id="starttime" name="starttime"/>
<input type="hidden" value="directphone" id="source" name="source"/>-->
</form>
<script type="text/javascript">
    function xuan() {
        /*if(document.getElementsByName("q8")[0].checked){
            document.getElementById("form1").action="jiaban";
            document.getElementById("form1").submit();
        }
        if(document.getElementsByName("q8")[1].checked){
            document.getElementById("form1").action="ditie";
            document.getElementById("form1").submit();
        }
        if(document.getElementsByName("q8")[2].checked){
            document.getElementById("form1").action="jiuba";
            document.getElementById("form1").submit();
        }
        if(document.getElementsByName("q9")[0].checked){
            document.getElementById("form1").action="jiaban";
            document.getElementById("form1").submit();
        }
        if(document.getElementsByName("q9")[1].checked){
            document.getElementById("form1").action="ditie";
            document.getElementById("form1").submit();
        }
        if(document.getElementsByName("q9")[2].checked){
            document.getElementById("form1").action="jiuba";
            document.getElementById("form1").submit();
        }*/

        var data = $('#form2').serialize();
        $.ajax({
            type: 'POST',
            data: data,
            url: '/investigate/save',
            dataType: 'json',
            success: function (data) {

            },
            error: function () {

            }
        })


    }
</script>
<script type="text/javascript">
    var isYdb = 0;
    var isPub = 0;
    var cqType = 1;
    var isDingDing = 0;
    var ddcorpid = "";
    var sojumpParm = '';
    var isKaoShi = 0;
    var lastTopic = 0;
    var Password = "";
    var PasswordExt = "";
    var pwdExt = "";
    var guid = "";
    var udsid = 0;
    var fromsour = "";
    var langVer = 0;
    var cProvince = "";
    var cCity = "";
    var cIp = "";
    var divTip = document.getElementById("divTip");
    var displayPrevPage = "none";
    var inviteid = '';
    var jbkid = '';
    var access_token = "";
    var openid = "";
    var wxUserId = "";
    var isQQLogin = 0;
    var wxthird = 0;
    var parterts = "";
    var parterjoiner = "";
    var partersign = "";
    var parterrealname = "";
    var parterextf = "";
    var relusername = "";
    var relts = "";
    var relsign = "";
    var relrealname = "";
    var reldept = "";
    var relext = "";
    var isPvw = 0;
    var user_token = "";
    var IsSampleService = 0;
    var hashb = 0;
    var sjUser = '';
    var outuser = '';
    var outsign = '';
    var sourceurl = '';
    var sourcename = "";
    var isSimple = '';
    var jiFenBao = 0;
    var cAlipayAccount = "";
    var isRunning = 1;
    var SJBack = '';
    var jiFen = "0";
    var FromSj = 0;
    var ItemDicData = "";
    var rndnum = "1897515460.10881702";
    var totalPage = 1;
    var totalCut = 0;
    var cepingCandidate = "";
    var cpid = "";
    var needSaveJoin = 0;
    var isChuangGuan = 0;
    var maxCgTime = 0;
    var maxOpTime = 0;
    var qBeginDate = "1528769349553";
    var randomMode = 0;
    var fisrtLoadTime = new Date().getTime();
    var isVip = 0;
    var LogStoreLocal = 0;
    var needAwardAlert = 0;
    var leftSeconds = 0 - 10;
    if (needAwardAlert) {
        var divawardalert = document.getElementById("divawardalert");
        var awt = $.trim($(divawardalert).text());
        if (awt)
            alert(awt);
    }
    var hasChuangGuanEnd = false;
</script>
<script type="text/javascript">
    var needAvoidCrack = 0;
    var tdCode = "tdCode";
    var imgCode = $("#imgCode")[0];
    var submit_text = $("#yucinput")[0];
    var tCode = $("#" + tdCode)[0];
    var hasTouPiao = 0;
</script>
<script>
    var page_title = document.title;
    $(window).scroll(function (e) {
        var scroll_value = $("#toptitle").offset().top + 48;
        var window_value = $(this).scrollTop();
        if (window_value > scroll_value) {
            $("title").text(page_title);
        } else {
            $("title").text("");
        }
    });
    $(function () {
        if (isWeiXin || window.top != window)
            $("title").text("");
    });


</script>
</body>

</html>