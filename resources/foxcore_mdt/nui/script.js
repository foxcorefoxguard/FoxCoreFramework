window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.type === "openMDT") {
        document.getElementById("mdtContainer").style.display = "block";
    }

    if (data.type === "searchResults") {
        let resultsList = document.getElementById("resultsList");
        resultsList.innerHTML = "";

        data.results.forEach(result => {
            let li = document.createElement("li");
            li.innerText = `${result.name} | Plate: ${result.plate} | Status: ${result.status}`;
            resultsList.appendChild(li);
        });
    }
});

function searchMDT() {
    let query = document.getElementById("searchInput").value;
    fetch(`https://foxcore_mdt/search`, {
        method: "POST",
        body: JSON.stringify({ query: query })
    });
}

function submitReport() {
    let reportText = document.getElementById("reportText").value;
    fetch(`https://foxcore_mdt/submitReport`, {
        method: "POST",
        body: JSON.stringify({ text: reportText })
    });
}

function closeMDT() {
    document.getElementById("mdtContainer").style.display = "none";
    fetch(`https://foxcore_mdt/closeMDT`, { method: "POST" });
}

window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.type === "fingerprintData") {
        document.getElementById("fingerprintName").innerText = data.name;
        document.getElementById("fingerprintDOB").innerText = data.dob;
        document.getElementById("fingerprintRecord").innerText = data.criminalRecord;
        document.getElementById("fingerprintImage").src = data.fingerprintImage;
    }

    if (data.type === "receiveCourtCases") {
        let casesList = document.getElementById("courtCasesList");
        casesList.innerHTML = "";

        data.cases.forEach(c => {
            let li = document.createElement("li");
            li.innerText = `Judge: ${c.judge} | Defendant: ${c.defendant} | Status: ${c.case_status}`;
            casesList.appendChild(li);
        });
    }
});

window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.type === "updateWarrantList") {
        let warrantList = document.getElementById("warrantList");
        warrantList.innerHTML = "";

        data.warrants.forEach(w => {
            let li = document.createElement("li");
            li.innerText = `Officer: ${w.officer} | Suspect: ${w.suspect} | Status: ${w.status}`;
            warrantList.appendChild(li);
        });
    }

    if (data.type === "receiveCourtCases") {
        let caseList = document.getElementById("courtCaseList");
        caseList.innerHTML = "";

        data.cases.forEach(c => {
            let li = document.createElement("li");
            li.innerText = `Judge: ${c.judge} | Defendant: ${c.defendant} | Status: ${c.case_status}`;
            caseList.appendChild(li);
        });
    }
});

window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.type === "updateEvidenceList") {
        let evidenceList = document.getElementById("evidenceList");
        evidenceList.innerHTML = "";

        data.evidence.forEach(e => {
            let li = document.createElement("li");
            li.innerText = `${e.description} (Uploaded by: ${e.officer})`;
            evidenceList.appendChild(li);
        });
    }

    if (data.type === "receiveCourtroomLogs") {
        let logsList = document.getElementById("courtLogsList");
        logsList.innerHTML = "";

        data.logs.forEach(l => {
            let li = document.createElement("li");
            li.innerText = `${l.sender}: ${l.message}`;
            logsList.appendChild(li);
        });
    }

    if (data.type === "receivePublicRecord") {
        let recordList = document.getElementById("publicRecordsList");
        recordList.innerHTML = `<h3>${data.title}</h3><p>${data.content}</p>`;
    }
});
