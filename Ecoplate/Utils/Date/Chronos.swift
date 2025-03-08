//
//  Chronos.swift
//  Cibusy
//
//  Created by Doğukan Çatmakaş on 29.04.2024.
//

import Foundation

public class Chronos {
    let months: [String] = [
        "Ocak", "Şubat", "Mart",
        "Nisan", "Mayıs", "Haziran",
        "Temmuz", "Ağustos", "Eylül",
        "Ekim", "Kasım", "Aralık",
    ]
    
    static var hours: [String] = [
        "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30",
        "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30",
        "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30",
        "20:00", "20:30", "21:00", "21:30", "22:00", "22:30", "23:00", "23:30",
    ]
    
    static var days: [String] = [
        "Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma", "Cumartesi", "Pazar"
    ]
    
    static var currentHourAndMinute: (hour: Int, minute: Int) {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        return (hour, minute)
    }
    
    private var date = Date()
    
    func selectedDate(from selectedDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "tr_TR")
        dateFormatter.dateFormat = "dd MMMM yyyy"
        return dateFormatter.string(from: selectedDate)
    }

    func timeAgoSinceDateString(_ isoDateString: String, numericDates: Bool = false) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        guard let date = formatter.date(from: isoDateString) else {
            return "Geçersiz tarih"  // Eğer tarih formatı hatalıysa
        }
        
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.minute, .hour, .day, .weekOfYear, .month, .year], from: date, to: now)
        
        if let year = components.year, year >= 2 {
            return "\(year) yıl önce"
        } else if let year = components.year, year >= 1 {
            return numericDates ? "1 yıl önce" : "Geçen yıl"
        } else if let month = components.month, month >= 2 {
            return "\(month) ay önce"
        } else if let month = components.month, month >= 1 {
            return numericDates ? "1 ay önce" : "Geçen ay"
        } else if let week = components.weekOfYear, week >= 2 {
            return "\(week) hafta önce"
        } else if let week = components.weekOfYear, week >= 1 {
            return numericDates ? "1 hafta önce" : "Geçen hafta"
        } else if let day = components.day, day >= 2 {
            return "\(day) gün önce"
        } else if let day = components.day, day >= 1 {
            return numericDates ? "1 gün önce" : "Dün"
        } else if let hour = components.hour, hour >= 2 {
            return "\(hour) saat önce"
        } else if let hour = components.hour, hour >= 1 {
            return numericDates ? "1 saat önce" : "1 saat önce"
        } else if let minute = components.minute, minute >= 2 {
            return "\(minute) dakika önce"
        } else if let minute = components.minute, minute >= 1 {
            return numericDates ? "1 dakika önce" : "1 dakika önce"
        } else {
            return "Az önce"
        }
    }
    
    /// HH:SS
    func timeFromDateString(_ isoDateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        guard let date = formatter.date(from: isoDateString) else {
            return "Geçersiz saat"
        }
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        timeFormatter.locale = Locale(identifier: "en_US_POSIX")
        timeFormatter.timeZone = TimeZone.current
        
        return timeFormatter.string(from: date)
    }
    
    /// DD.MM.YYYY - HH:SS
    func formattedDateString(_ isoDateString: String) -> String {
        let formats = ["yyyy-MM-dd'T'HH:mm:ss.SSSSSS", "yyyy-MM-dd'T'HH:mm:ss"]
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "tr_TR")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)

        for format in formats {
            formatter.dateFormat = format
            if let date = formatter.date(from: isoDateString) {
                let outputFormatter = DateFormatter()
                outputFormatter.dateFormat = "d MMMM yyyy - HH:mm"
                outputFormatter.locale = Locale(identifier: "tr_TR")
                outputFormatter.timeZone = TimeZone.current
                return outputFormatter.string(from: date)
            }
        }
        
        return "Geçersiz tarih"
    }
    
}
