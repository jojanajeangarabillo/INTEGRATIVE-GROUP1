<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">

<html>
<head>
    <title>Student Service Request</title>

    <style>
        body{
            margin:0;
            padding:0;
            font-family: Arial, sans-serif;
            background:#e6e6eb;
        }

        .heading{
            color:#1f5fa8;
            padding:5px;
            background-color: white;
            font-size: 0.875rem;
            border-bottom: 1px solid #1f5fa8;
        }

        .heading h1{
            margin: 1rem;
        }

        .container{
            display:flex;
            flex-direction: column;
            justify-content:space-between;
            padding:20px;
            background:white;
            margin:2.75rem;
            border-radius:14px;
        }

        .card-container{
            display:flex;
            justify-content:space-between;
            gap:20px;
        }

        .subheading{
            display:flex;
            justify-content:space-between;
            align-items:flex-end;
            gap:20px;
            padding: 10px;
        }

        .subheading-text{
            display:flex;
            flex-direction:column;
            gap:8px;
            min-width:0;
        }

        .subheading span{
            color:#1f5fa8;
            font-size:20px;
            font-weight:bold;
            margin:0;
        }

        .subheading p{
            color:#444;
            font-size:14px;
            margin:0;
        }

        .filter-row{
            display:flex;
            justify-content:flex-end;
            align-items:center;
            gap:10px;
            margin-bottom:0;
            font-size:14px;
            color:#333;
        }

        .filter-row select{
            padding:8px 10px;
            border-radius:8px;
            border:1px solid #ccc;
            background:#fff;
        }

        .card{
            width:250px;
            height:110px;
            border-radius:14px;
            margin:0 auto 18px auto;
            display:flex;
            flex-direction:row;
            justify-content:space-between;
            align-items:center;
            padding: 20px;
        }

        .card-title{
            font-size:14px;
            font-weight:bold;
            margin-bottom:10px;
        }

        .card-number{
            font-size:48px;
            font-weight:bold;
            line-height:50px;
        }

        table{
            width:100%;
            border-collapse:collapse;
            background:transparent;
        }

        th{
            background:#eea121;
            color:white;
            padding:18px 10px;
            font-size:15px;
            text-align:center;
        }

        td{
            padding:16px 10px;
            text-align:center;
            border-bottom:1px solid #e3b36a;
            font-size:14px;
            color:#444;
        }

        tr:hover{
            background:#f5f5f5;
        }

        .approved-card{
            background:#abd2ae;
        }

         .pending-card{
            background:#efe1a9;
        }

        .released-card{
            background:#efb0b0;
        }

    </style>
    <script>
        function filterStatus() {
            var filter = document.getElementById('statusFilter').value;
            var rows = document.querySelectorAll('table tr[data-status]');
            rows.forEach(function(row) {
                var status = row.getAttribute('data-status');
                row.style.display = (filter === 'All' || status === filter) ? '' : 'none';
            });
        }
    </script>
</head>

<body>

    <div class="heading">
        <h1>Student Services Request System</h1>
    </div>

    <div class="container">
        <div class="subheading">
            <div class="subheading-text">
                    <span>System Overview</span>
                    <p>Metrics blah blah blah</p>
            </div>
        </div>

        <div class="card-container">
        <div class="card approved-card">
            <span class="card-title">Approved</span>
            <span class="card-number">
                <xsl:value-of select="count(StudentServicesRequestSystem/Request[Status='Approved'])"/>
            </span>
        </div>
        
        <div class="card pending-card">
            <span class="card-title">Pending</span>
            <span class="card-number">
                <xsl:value-of select="count(StudentServicesRequestSystem/Request[Status='Pending'])"/>
            </span>
        </div>

        <div class="card released-card">
            <span class="card-title">Released</span>
            <span class="card-number">
                <xsl:value-of select="count(StudentServicesRequestSystem/Request[Status='Released'])"/>
            </span>
        </div>

        <div class="card approved-card">
            <span class="card-title">ID</span>
            <span class="card-number">
                <xsl:value-of select="count(StudentServicesRequestSystem/Request[RequestType='ID'])"/>
            </span>
        </div>

        <div class="card pending-card">
            <span class="card-title">TOR</span>
            <span class="card-number">
                <xsl:value-of select="count(StudentServicesRequestSystem/Request[RequestType='TOR'])"/>
            </span>
        </div>

        <div class="card released-card">
            <span class="card-title">Certificate</span>
            <span class="card-number">
                <xsl:value-of select="count(StudentServicesRequestSystem/Request[RequestType='Certificate'])"/>
            </span>
        </div>
        </div>



    </div>

    <div class="container">
        <div class="subheading">
            <div class="subheading-text">
                <span>Requests</span>
                <p>List of all student service requests</p>
            </div>
            <div class="filter-row">
                <label for="statusFilter">Status:</label>
                <select id="statusFilter" onchange="filterStatus()">
                    <option value="All">All</option>
                    <option value="Approved">Approved</option>
                    <option value="Pending">Pending</option>
                    <option value="Released">Released</option>
                </select>
            </div>
        </div>

        <table>
            <tr>
                <th>ID Number</th>
                <th>StudentName</th>
                <th>Course</th>
                <th>Year &amp; Section</th>
                <th>Document Type</th>
                <th>Date Requested</th>
                <th>Status</th>
                <th>Release Date</th>
            </tr>

            <xsl:for-each select="StudentServicesRequestSystem/Request">

                <tr data-status="{Status}">

                    <td>
                        <xsl:value-of select="@studentID"/>
                    </td>

                    <td>
                        <xsl:value-of select="StudentName"/>
                    </td>

                    <td>
                        <xsl:value-of select="Course"/>
                    </td>

                    <td>
                        <xsl:value-of select="Year"/> <xsl:value-of select="Section"/>
                    </td>

                    <td>
                        <xsl:value-of select="RequestType"/>
                    </td>

                    <td>
                        <xsl:value-of select="DateRequested"/>
                    </td>

                    <td>
                        <xsl:choose>

                            <xsl:when test="Status='Approved'">
                                <span class="approved">
                                    <xsl:value-of select="Status"/>
                                </span>
                            </xsl:when>

                            <xsl:when test="Status='Pending'">
                                <span class="pending">
                                    <xsl:value-of select="Status"/>
                                </span>
                            </xsl:when>

                            <xsl:otherwise>
                                <span class="released">
                                    <xsl:value-of select="Status"/>
                                </span>
                            </xsl:otherwise>

                        </xsl:choose>
                    </td>

                    <td>
                        <xsl:value-of select="ReleaseDate"/>
                    </td>

                </tr>

            </xsl:for-each>

        </table>
    </div>

</body>
</html>

</xsl:template>

</xsl:stylesheet>