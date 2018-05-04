package com.wrox.manager;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public final class SessionRegistry {

    private static final Map<String, HttpSession> sessionMap = new ConcurrentHashMap<>();

    private SessionRegistry() {
    }

    public static void addSession(HttpSession session) {
        sessionMap.put(session.getId(), session);
    }

    public static void deleteSession(HttpSession session) {
        sessionMap.remove(session.getId());
    }

    public static void updateSessionId(HttpSession session, String oldSessionId) {
        synchronized (sessionMap) {
            sessionMap.remove(oldSessionId);
            addSession(session);
        }
    }

    public static ArrayList<HttpSession> getSessionList() {
        return new ArrayList<>(sessionMap.values());
    }

    public static int getNumberOfSessions() {
        return sessionMap.size();
    }
}
