package com.wanzi.util;

/**
 * User: meichao
 * Date: 14-2-28
 * Time: 下午2:26
 */

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.commons.lang.time.DateUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;



public class DateUtil extends DateUtils {
    private final static Logger log = LogManager.getLogger(DateUtil.class);
    public static final String DEFAULT_DATE_FORMATE = "yyyy-MM-dd HH:mm:ss";
    public static final String DATE_FORMATE_1 = "yyyy-MM-dd";
    public static final  int TIME_DAY_MILLISECOND = 24 * 60 * 60 * 1000;
    public static final  int TIME_DAY_MILLIHOUR = 60 * 60 * 1000;
    private static final int RATIO = 1000;
    public static final String DATE_FORMAT = "yyyy-MM-dd";


    /**
     * 取得某日期时间的特定表示格式的字符串
     *
     * @param format 时间格式
     * @param date   某日期（Date）
     * @return 某日期的字符串
     */
    public static synchronized String getDate2Str(String format, Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
        simpleDateFormat.applyPattern(format);
        return simpleDateFormat.format(date);
    }

    public static Date addDays(Date date, int amount) {
        return addDay(date, Calendar.DAY_OF_MONTH, amount);
    }
    public static Date addDay(Date date, int calendarField, int amount) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(calendarField, amount);
        return c.getTime();
    }
    /**
     * 按yyyy-MM-ddTHH:mm:ss格式转换成Date ,并去掉时分秒
     * @param str
     * @return
     */
    public static synchronized  Date strToDateByT(String str){
        if(str.length()<10){
            return null;
        } else{
            return strToDate("yyyy-MM-dd", str.substring(0,10));
        }

    }


    /**
     * 将特定格式的时间字符串转化为Date类型
     *
     * @param format 时间格式
     * @param str    某日期的字符串
     * @return 某日期（Date）
     */
    public static synchronized Date strToDate(String format, String str) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
        simpleDateFormat.applyPattern(format);
        ParsePosition parseposition = new ParsePosition(0);
        return simpleDateFormat.parse(str, parseposition);
    }

    public static Date strToDate(String str) {
        return strToDate(DEFAULT_DATE_FORMATE, str);
    }

    public static String date2String(Date date) {
        return getDate2Str(DEFAULT_DATE_FORMATE, date);
    }

    public static String date2String(Date date, String format) {
        return getDate2Str(format, date);
    }


    public static String date2String1(Date date) {
        return getDate2Str(DATE_FORMATE_1, date);
    }


    /**
     * 检测字符串是否为日期
     *
     * @param dateTime 时间字符串
     * @param pattern  Eg "yyyy-MM-dd"
     * @return 返回结果
     */
    public static boolean isDateTime(String dateTime, String pattern) {
        DateFormat df = new SimpleDateFormat(pattern);
        ParsePosition pos = new ParsePosition(0);
        Date dt = df.parse(dateTime, pos);
        return !(dt == null);
    }

    public static XMLGregorianCalendar getXMLGregorianCalendar(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        XMLGregorianCalendar xmlCalendar = null;
        try {
            DatatypeFactory dtf = DatatypeFactory.newInstance();
            xmlCalendar = dtf.newXMLGregorianCalendar(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH) + 1,
                    calendar.get(Calendar.DAY_OF_MONTH), calendar.get(Calendar.HOUR_OF_DAY), calendar.get(Calendar.MINUTE),
                    calendar.get(Calendar.SECOND), calendar.get(Calendar.MILLISECOND), calendar.get(Calendar.ZONE_OFFSET) / (1000 * 60));
        } catch (Exception e) {
            log.error("getXMLGregorianCalendar error!", e);
        }
        return xmlCalendar;
    }


    public static Date convertToDate(XMLGregorianCalendar cal) {
        GregorianCalendar ca = cal.toGregorianCalendar();
        return ca.getTime();
    }

    public boolean passTime(Date tempDate, int hour) {
        return !(tempDate == null || hour <= 0) && tempDate.before(getLimitDate(hour));
    }

    /**
     * 得到n小时前时间
     *
     * @param hour 小时数
     * @return Date
     */
    private Date getLimitDate(int hour) {
        Calendar cl = Calendar.getInstance();
        Long clTemp = cl.getTimeInMillis() - hour * 60 * 60 * 1000;
        cl.setTimeInMillis(clTemp);
        return cl.getTime();
    }

    /**
     * 比较两个时间
     *
     * @param date1
     * @param date2
     * @return
     */
    private boolean compareDate(Date date1, Date date2) {
        boolean flag = false;
        if (date1.after(date2)) {
            flag = true;
        }
        return flag;
    }

    /**
     * 通过日期获取当天是星期几
     *
     * @param date
     * @return
     */
    public static String date2Week(Date date) {
        String[] weekDays = {"\u661F\u671F\u65E5", "\u661f\u671f\u4e00", "\u661f\u671f\u4e8c", "\u661f\u671f\u4e09", "\u661f\u671f\u56db", "\u661f\u671f\u4e94", "\u661f\u671f\u516d"};
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0) {
            w = 0;
        }
        return weekDays[w];
    }

    /**
     * 1,2,3 ..
     * 返回周几（1：周一，7：周日）
     * @param date
     * @return
     */
    public static String date2WeekNum(Date date){
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if(w==0){
            return "7";
        }
        return String.valueOf(w);
    }

    /**
     *
     * @param date
     * @return 周一...
     */
    public static String date2WeekCnNum(Date date){
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if(w==0){
            w =  7;
        }
        return weekCn(String.valueOf(w));
    }

    private static String weekCn(String w){
        if(w.equals("1")){
            return "周一";
        }else if(w.equals("2")){
            return "周二";
        }else if(w.equals("3")){
            return "周三";
        }else if(w.equals("4")){
            return "周四";
        }else if(w.equals("5")){
            return "周五";
        }else if(w.equals("6")){
            return "周六";
        }else {
            return "周日";
        }
    }

    /**
     * 返回 2012年8月29日
     * @param date yyyy-MM-dd
     * @return
     */
    public static String date2StringAndWeekNum(Date date){
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        Integer[] da = new Integer[3];
        da[0] = c.get(Calendar.YEAR);
        da[1] = c.get(Calendar.MONTH) + 1;
        da[2] = c.get(Calendar.DATE);
        return c.get(Calendar.YEAR)+"年"+(c.get(Calendar.MONTH)+1)+"月"+c.get(Calendar.DATE)+"日";
    }

    /**
     * 月-日
     * 返回 8-29
     * @param date
     * @return
     */
    public static String date2MonthAndWeekNum(Date date){
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        Integer[] da = new Integer[3];
        da[0] = c.get(Calendar.YEAR);
        da[1] = c.get(Calendar.MONTH) + 1;
        da[2] = c.get(Calendar.DATE);
        String zhou = weekCn(date2WeekNum(date));
        return (c.get(Calendar.MONTH)+1)+"-"+c.get(Calendar.DATE);
    }

    /**
     * 返回 8月-29日
     * @param date
     * @return
     */
    public static String date2CnMonthAndWeekNum(Date date){
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        Integer[] da = new Integer[3];
        da[0] = c.get(Calendar.YEAR);
        da[1] = c.get(Calendar.MONTH) + 1;
        da[2] = c.get(Calendar.DATE);
        String zhou = weekCn(date2WeekNum(date));
        return (c.get(Calendar.MONTH)+1)+"月"+c.get(Calendar.DATE)+"日";
    }



    public static String date2WeekForString(String date){
        if(date!=null&&!date.trim().equals(0)){
            return    date2Week(new Date(Long.valueOf(date.trim())*1000));
        }
        return null;
    }

    /**
     * 字符串日期转换为查询的开始日期
     *
     * @param dateStr yyyy-MM-dd
     * @return
     */
    public static long str2startTime(String dateStr) {
        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return dateTimeFormat
                    .parse(dateStr + " 00:00:00")
                    .getTime() / RATIO;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 字符串日期转换为查询的截止日期
     *
     * @param dateStr yyyy-MM-dd
     * @return
     */
    public static long str2endTime(String dateStr) {
        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return dateTimeFormat
                    .parse(dateStr + " 23:59:59")
                    .getTime() / RATIO;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 根据格式得到格式化后的日期
     *
     * @param currDate 要格式化的日期
     * @param format   日期格式，如yyyy-MM-dd
     * @return Date 返回格式化后的日期，格式由参数<code>format</code>
     *         定义，如yyyy-MM-dd，如2006-02-15
     * @see java.text.SimpleDateFormat#parse(java.lang.String)
     */
    public static Date getFormatDate(String currDate, String format) {
        if (currDate == null) {
            return null;
        }
        SimpleDateFormat dtFormatdB = null;
        try {
            dtFormatdB = new SimpleDateFormat(format);
            return dtFormatdB.parse(currDate);
        } catch (Exception e) {
            dtFormatdB = new SimpleDateFormat(DATE_FORMAT);
            try {
                return dtFormatdB.parse(currDate);
            } catch (Exception ex) {
            }
        }
        return null;
    }

    /**
     * 根据格式得到格式化后的时间
     *
     * @param currDate 要格式化的时间
     * @param format   时间格式，如yyyy-MM-dd HH:mm:ss
     * @return String 返回格式化后的时间，格式由参数<code>format</code>定义，如yyyy-MM-dd
     *         HH:mm:ss
     * @see java.text.SimpleDateFormat#format(java.util.Date)
     */
    public static String getFormatDateTime(java.util.Date currDate, String format) {
        if (currDate == null) {
            return "";
        }
        SimpleDateFormat dtFormatdB = null;
        try {
            dtFormatdB = new SimpleDateFormat(format);
            return dtFormatdB.format(currDate);
        } catch (Exception e) {
            dtFormatdB = new SimpleDateFormat(DEFAULT_DATE_FORMATE);
            try {
                return dtFormatdB.format(currDate);
            } catch (Exception ex) {
            }
        }
        return "";
    }

    /**
     * 根据格式得到格式化后的日期
     *
     * @param currDate 要格式化的日期
     * @param format   日期格式，如yyyy-MM-dd
     * @return String 返回格式化后的日期，格式由参数<code>format</code>
     *         定义，如yyyy-MM-dd，如2006-02-15
     * @see java.text.SimpleDateFormat#format(java.util.Date)
     */
    public static String getFormatDate(java.util.Date currDate, String format) {
        if (currDate == null) {
            return "";
        }
        SimpleDateFormat dtFormatdB = null;
        try {
            dtFormatdB = new SimpleDateFormat(format);
            return dtFormatdB.format(currDate);
        } catch (Exception e) {
            dtFormatdB = new SimpleDateFormat(DATE_FORMAT);
            try {
                return dtFormatdB.format(currDate);
            } catch (Exception ex) {
            }
        }
        return null;
    }

    /**
     * 得到格式化后的时间，格式为yyyy-MM-dd HH:mm:ss，如2006-02-15 15:23:45
     *
     * @param currDate 要格式化的时间
     * @return String 返回格式化后的时间，默认格式为yyyy-MM-dd HH:mm:ss，如2006-02-15 15:23:45
     * @see #getFormatDateTime(java.util.Date, String)
     */
    public static String getFormatDateTime(java.util.Date currDate) {
        return getFormatDateTime(currDate, DEFAULT_DATE_FORMATE);
    }

    /**
     * 取得当前系统时间，返回java.util.Date类型
     *
     * @return java.util.Date 返回服务器当前系统时间
     * @see java.util.Date
     */
    public static Date getCurrDate() {
        return new Date();
    }

    /**
     * 取得当前系统时间戳
     *
     * @return java.sql.Timestamp 系统时间戳
     * @see java.sql.Timestamp
     */
    public static Timestamp getCurrTimestamp() {
        return new Timestamp(System.currentTimeMillis());
    }

    /**
     * 从时间串中获取小时数。
     *
     * @param timestr "2007-10-12 13:25:00"
     * @return
     */
    public static int getHourFromTimeString(String timestr) {
        if (StringUtils.isBlank(timestr)) {
            return 0;
        }

        return Integer.parseInt(timestr.substring(timestr.length() - 8, timestr.length() - 6));
    }

    /**
     * 得到本日的上月时间 如果当日为2007-9-1,那么获得2007-8-1
     */
    public static String getDateBeforeMonth() {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -1);
        return getFormatDate(cal.getTime(), DATE_FORMAT);
    }

    /**
     * 得到本日的前几个月时间 如果number=2当日为2007-9-1,那么获得2007-7-1
     */
    public static String getDateBeforeDay(int number) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -number);
        return getFormatDate(cal.getTime(), DATE_FORMAT);
    }

    /**
     * 得到几天前的时间
     */
    public static String getDateBeforeMonth(int number) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -number);
        return getFormatDate(cal.getTime(), DATE_FORMAT);
    }


    /**
     * 获得两个Date型日期之间相差的天数（第2个减第1个）
     *
     * @param first
     * @param second
     * @return int 相差的天数
     */
    public static int getDaysBetweenDates(Date first, Date second) {
        Long mils = (second.getTime() - first.getTime()) / (TIME_DAY_MILLISECOND);
        return mils.intValue();
    }

    /**
     * 获得两个Date型日期之间相差的小时（第2个减第1个）
     *
     * @param first
     * @param second
     * @return int 相差的小时
     */
    public static int getHoursBetweenDays(Date first, Date second) {
        Long mils = (second.getTime() - first.getTime()) / (TIME_DAY_MILLIHOUR);
        return mils.intValue();
    }


    /**
     * 比较2个日期大小
     * date2 > date1 return 1
     * date2 < date1 return -1
     * @param date1
     * @param date2
     * @return
     */
    public static int compareTime(Date date1,Date date2){
        return date2.compareTo(date1);
    }

    /**
     * 比较2个日期是否相等
     * @param date1
     * @param date2
     * @return
     */
    public static boolean compareTimeEquals(Date date1,Date date2){
        String d1 = DateFormatUtils.format(date1, "yyyyMMdd");
        String d2 = DateFormatUtils.format(date2, "yyyyMMdd");
        if(d1.equals(d2)){
            return true;
        }
        return false;
    }
    //比较时间(当天的小时)
    public static boolean compareTime(Date nowDate,String minute){
        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String subDate=dateTimeFormat.format(nowDate).toString().substring(0,10);
        try {
            long nowTime=nowDate.getTime();
            long minuteTime=dateTimeFormat.parse(subDate+" "+minute).getTime();
            if(nowTime - minuteTime>0){
                return true;
            }
        } catch (ParseException e) {

        }
        return false;
    }
    //比较两个分钟大小
    public static boolean compareTimeMi(Date nowDate,String start,String end){
        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        //Date nowDate = new Date();
        String subDate=dateTimeFormat.format(nowDate).toString().substring(0,10);
        try {
            long st=dateTimeFormat.parse(subDate+" "+start).getTime();
            long en=dateTimeFormat.parse(subDate+" "+end).getTime();
            if(en - st>0){
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    /**
     * 比较两个时间的大小 参数格式 HH:mm
     * 当start大于等于end时返回 true ，其它的返回false
     * @param start
     * @param end
     * @return
     */
    public static boolean compareHourMinute(String start,String end){
        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("HH:mm");
        try {
            long st=dateTimeFormat.parse(start).getTime();
            long en=dateTimeFormat.parse(end).getTime();
            if(st - en>=0){
                return true;
            }
        } catch (Exception e) {
            log.error("输入的日期有误！：",e);
        }
        return false;
    }

    /**
     *  根据指定合法格式的字符串转化成时间
     *  合法格式，比如：yyyy-MM-dd HH:mm , HH:mm , yyyy-MM-dd 等等
     * @param str
     * @param pattern
     * @return
     */
    public static Date stringToDate(String str, String pattern) {
        Date time = new Date();
        SimpleDateFormat sd = new SimpleDateFormat(pattern);
        try {
            time = sd.parse(str);
        } catch (ParseException e) {
            log.error("输入的日期格式有误！：", e);
        }
        return time;
    }

    /**
     * 根据指定合法的格式，转换时间成相应格式的字符串
     * 合法格式，比如：yyyy-MM-dd HH:mm , HH:mm , yyyy-MM-dd 等等
     *
     * @param date
     * @param pattern
     * @return
     */
    public static String dateToString(Date date, String pattern) {
        String time = "";
        SimpleDateFormat sd = new SimpleDateFormat(pattern);
        try {
            time = sd.format(date);
        } catch (Exception e) {
            log.error("输入的日期格式有误！：", e);
        }
        return time;
    }

    /**
     *  6月9日零点至6月14日23点59分59秒 全场返100%积分
     * @return
     */
    public static Boolean juneScoreSalePromotion() {
        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Boolean result=false;
        try{
            Date startTime=dateTimeFormat.parse("2012-06-09 00:00:00");
            Date endTime=dateTimeFormat.parse("2012-06-14 23:59:59");
//               Date now =dateTimeFormat.parse("2012-06-09 00:00:01");
            Date now =new Date();
            if(now.after(startTime)&&now.before(endTime)){
                result=true;
            }
        }catch (Exception e){
            log.error("酒店 6月9日零点至6月14日23点59分59秒 全场返100%积分，判断时间异常：",e);
        }
        return result;
    }

    /**
     * 2012-09-12  --->2012年9月
     * @param yearString
     * @return
     */
    public static String getFitYearMonth(String yearString){
        String yearCn="";
        try {
            String yearAndMonth[] = yearString.split("-");
            int m = Integer.parseInt(yearAndMonth[1]);
            yearCn = yearAndMonth[0]+"年"+m+"月";
        } catch (Exception e) {
            log.error("参数错误："+yearString);
        }
        return yearCn;
    }

    /**
     * 获取当年的年、月、日
     * @return
     */
    public static Integer[] getCurrentYearMonthDate(){
        Calendar c=Calendar.getInstance();
        Integer[] date=new Integer[3];
        date[0]=c.get(Calendar.YEAR);
        date[1]=c.get(Calendar.MONTH)+1;
        date[2]=c.get(Calendar.DATE);
        System.out.println(c.get(Calendar.YEAR)+"年"+(c.get(Calendar.MONTH)+1)+"月"+c.get(Calendar.DATE)+"日");
        return date;
    }

    /**
     * UNIX时间戳转化为指定格式的java时间
     * @param timestampString
     * @param formats
     * @return
     */
    public static Date timeStamp2Date(String timestampString, String formats){
        Long timestamp = Long.parseLong(timestampString)*1000;
        String date =date2String(new java.util.Date(timestamp));
        log.info("转换成的时间：date="+date);
        return stringToDate(date,formats);
    }
    //比较当前时间戳和给定时间戳是否超过compareHours超过返回true否则false,compareHours为要比较的小时数
    public static boolean compareTheTime(long time,int compareHours){
        long current = System.currentTimeMillis();
        if((current-time)>TIME_DAY_MILLIHOUR*compareHours){
            return true;
        }else{
            return false;
        }
    }
    //测试方法
    public static void main(String[] args) {
        System.out.println(getFitYearMonth("2012-09-13"));
        Integer[] dates=getCurrentYearMonthDate();
        for(Integer date:dates){
            System.out.println(date);

        }
        int a =  getHourFromTimeString("2007-10-12 13:25:00");
        System.out.println("a = " + a);
//        String start="08:00";
//        String end="10:12";
//        System.out.println("输出完成了start="+start+"---end="+end +"result="+compareHourMinute(start,end));
//        String start1="10:12";
//        String end1="10:12";
//        System.out.println("输出完成了start="+start1+"---end="+end1 +"result1="+compareHourMinute(start1,end1));
//        String start2="12:00";
//        String end2="13:12";
//        System.out.println("输出完成了start="+start2+"---end="+end2 +"result2="+compareHourMinute(start2,end2));
//        String start3="21:00";
//        String end3="23:59";
//        System.out.println("输出完成了start="+start3+"---end="+end3 +"result3="+compareHourMinute(start3,end3));
//        String start4="6:0";
//        String end4="8:5";
//        System.out.println("输出完成了start="+start4+"---end="+end4 +"result4="+compareHourMinute(start4,end4));
//        System.out.println(stringToDate("2012-02-02 12","yyyy-MM-dd HH"));
//        System.out.println(dateToString(new Date(),"yyyyMM-dd"));
    }
}
