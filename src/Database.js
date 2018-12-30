/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the documentation of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

function dbInit()
{
    var db = LocalStorage.openDatabaseSync("Qt_Fee_Management", "1.0", "Database to maintain student fee details", 1000000)
    try {
        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS Student_Details (date text,name text,class text,rollnumber text,gender text,dob text,fathername text,mothername text,mobile numeric,regularfee text,concession text,finalfee text)')
        })
    } catch (err) {
        console.log("Error creating table in database: " + err)
    };
}

function dbGetHandle()
{
    try {
        var db = LocalStorage.openDatabaseSync("Qt_Fee_Management", "1.0",
                                               "Database to maintain student fee details", 1000000)
    } catch (err) {
        console.log("Error opening database: " + err)
    }
    return db
}

function dbInsert(Pdate, Pname, Pclass, Prollnumber, Pgender, Pdob, Pfathername, Pmothername, Pmobile, Pregularfee, Pconcession, Pfinalfee)
{
    var db = dbGetHandle()
    var rowid = 0;
    try {
        db.transaction(function (tx) {
            tx.executeSql('INSERT INTO Student_Details VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
                          [Pdate, Pname, Pclass, Prollnumber, Pgender, Pdob, Pfathername, Pmothername, Pmobile, Pregularfee, Pconcession, Pfinalfee])
            var result = tx.executeSql('SELECT last_insert_rowid()')
            rowid = result.insertId
        })
    } catch (err) {
        console.log("Error inserting into database: " + err)
    }
    return rowid;
}

function dbReadAll()
{
    var db = dbGetHandle()
    var results;
    db.transaction(function (tx) {
        results = tx.executeSql(
                    'SELECT date,name,class,rollnumber,gender,dob,fathername,mothername,mobile,regularfee,concession,finalfee FROM Student_Details order by name desc')
    })
    return results;
}

function dbUpdate(Pdate, Pdesc, Pdistance, Prowid)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql(
                    'update trip_log set date=?, trip_desc=?, distance=? where rowid = ?', [Pdate, Pdesc, Pdistance, Prowid])
    })
}

function dbDeleteRow(Prowid)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql('delete from trip_log where rowid = ?', [Prowid])
    })
}
