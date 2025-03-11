window.addEventListener("message", function(event) {
    if (event.data.action === "openJobCenter") {
        document.querySelector(".job-center").style.display = "flex";
        loadJobs(event.data.jobs);
    }
});

function loadJobs(jobs) {
    const jobList = document.getElementById("job-list");
    jobList.innerHTML = "";
    jobs.forEach(job => {
        let jobCard = `
            <div class="job-card">
                <h3>${job.icon} ${job.name}</h3>
                <p>${job.company} - ${job.location}</p>
                <p>Salary: $${job.salary[0]} - $${job.salary[1]}</p>
                <button class="apply-btn" onclick="applyJob('${job.event}')">Apply Now</button>
            </div>
        `;
        jobList.innerHTML += jobCard;
    });
}

function applyJob(event) {
    fetch(`https://${GetParentResourceName()}/applyJob`, {
        method: "POST",
        body: JSON.stringify({ event }),
        headers: { "Content-Type": "application/json" }
    });
}

function closeUI() {
    fetch(`https://${GetParentResourceName()}/closeUI`, { method: "POST" });
}
