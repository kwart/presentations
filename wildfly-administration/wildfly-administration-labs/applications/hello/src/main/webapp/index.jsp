<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" session="false"%>
<%@ page import="java.util.logging.*" %>
<html>
<head><title>Hello!</title></head>
<body>
<h1>Hello!</h1>
<p>
System property test=<%= System.getProperty("test") %>
</p>
<p>
<h2>Printing log messages</h2>
<pre>
<%
Logger warnLogger = Logger.getLogger("training.hello.warning");
Logger debugLogger = Logger.getLogger("training.hello.debug");
Level[] levels = { Level.SEVERE, Level.WARNING, Level.INFO, Level.CONFIG, Level.FINE,
    Level.FINER, Level.FINEST };

for (Level level : levels) {
    out.println("Logging messages with " + level.getName() + " importance level");
    warnLogger.log(level, "Message to Warning Logger with level: " + level.getLocalizedName());
    debugLogger.log(level, "Message to Debug Logger with level: "  + level.getLocalizedName());
}
%>
</pre>
</p>
</body>
</html>
