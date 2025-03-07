function loadJobs() {
    fetch(`https://foxcore_phone/getJobs`, { method: "POST" })
        .then(response => response.json())
        .then(data => {
            let list = document.getElementById("jobList");
            list.innerHTML = "";
            data.jobs.forEach(job => {
                let li = document.createElement("li");
                li.textContent = `${job.title} - ${job.status}`;
                list.appendChild(li);
            });
        });
}

function applyJob() {
    let title = document.getElementById("jobTitle").value;
    let description = document.getElementById("jobDescription").value;

    fetch(`https://foxcore_phone/applyJob`, {
        method: "POST",
        body: JSON.stringify({ title, description })
    });
}
