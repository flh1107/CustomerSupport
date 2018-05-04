package com.wrox.listener;

import com.wrox.manager.SessionRegistry;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionIdListener;
import javax.servlet.http.HttpSessionListener;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebListener
public class SessionListener implements HttpSessionListener, HttpSessionIdListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println(this.date() + ": Session(" + se.getSession().getId() + ") created.");
        SessionRegistry.addSession(se.getSession());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println(this.date() + ": Session(" + se.getSession().getId() + ") destroyed.");
        SessionRegistry.deleteSession(se.getSession());
    }

    @Override
    public void sessionIdChanged(HttpSessionEvent se, String oldSessionId) {
        System.out.println(this.date() + ": Session ID(" + oldSessionId + ") changed to (" + se.getSession().getId()
                + ")");
        SessionRegistry.updateSessionId(se.getSession(), oldSessionId);
    }


    private String date() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss");
        return dateFormat.format(new Date());
    }
}
