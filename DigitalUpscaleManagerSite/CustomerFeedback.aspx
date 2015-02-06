﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerFeedback.aspx.cs" Inherits="CustomerFeedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Feedback</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="Styles/Styles.css" rel="stylesheet" />
    <meta name="description" content="Displays feedback for a customer" />
</head>
<body>
    <header class="navbar">
        <h1>Digital Upscale Manager for Ballgames</h1>
        <h2>"Managing Ballgames with Technology"</h2>
    </header>
    <section class="container">
        <form id="form1" runat="server">
            <div class="identification">
                <h3>Customer Feedback</h3>
                <asp:Label runat="server" Text="Customer ID:" ID="lblCustomerID"></asp:Label>

                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtCustomerID" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CompareValidator ID="cvCustomerID" runat="server" ControlToValidate="txtCustomerID" CssClass="message" Display="Dynamic" Operator="DataTypeCheck" Type="Integer">Must be a number.</asp:CompareValidator>
                &nbsp;&nbsp;<asp:RequiredFieldValidator ID="rfvCustomerID" runat="server" ControlToValidate="txtCustomerID" CssClass="message" Display="Dynamic" ErrorMessage="RequiredFieldValidator">This field cannot be blank.</asp:RequiredFieldValidator>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Button ID="btnFeedback" runat="server" Text="Show Feedback" OnClick="btnFeedback_Click" />
                <br />
                <br />
                <asp:Label ID="lblFeedbackMessage" runat="server" CssClass="message"></asp:Label>
                <br />
                <br />
            </div>
            <asp:Panel runat="server" ID="pnlFeedback">
                <asp:Label ID="lblFeedback" runat="server" Text="Your closed feedback:"></asp:Label>
                <br />
                <asp:ListBox ID="lstFeedback" runat="server" Height="133px" Width="505px"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CustomerFeedbackConnectionString %>" ProviderName="<%$ ConnectionStrings:CustomerFeedbackConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Feedback] ORDER BY [FeedbackID], [CustomerID]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="rfvFeedbackList" runat="server" ControlToValidate="lstFeedback" CssClass="message" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="feedback">You must select a feedback.</asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="lblServiceTime" runat="server" Text="Please rate the service time"></asp:Label>
                <asp:RadioButtonList ID="rblServiceTime" runat="server">
                    <asp:ListItem Selected="True" Value="1">Satisfied</asp:ListItem>
                    <asp:ListItem Value="2">Neither Satisfied Nor Dissatisfied</asp:ListItem>
                    <asp:ListItem Value="3">Dissatisfied</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <asp:Label ID="lblEfficiency" runat="server" Text="Please rate the technical efficiency"></asp:Label>
                <br />
                <asp:RadioButtonList ID="rblEfficiency" runat="server">
                    <asp:ListItem Selected="True" Value="1">Satisfied</asp:ListItem>
                    <asp:ListItem Value="2">Neither Satisfied Nor Dissatisfied</asp:ListItem>
                    <asp:ListItem Value="3">Dissatisfied</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <asp:Label ID="lblEfficiency0" runat="server" Text="Please rate the resolution of your problem"></asp:Label>
                <br />
                <asp:RadioButtonList ID="rblResolution" runat="server">
                    <asp:ListItem Selected="True" Value="1">Satisfied</asp:ListItem>
                    <asp:ListItem Value="2">Neither Satisfied Nor Dissatisfied</asp:ListItem>
                    <asp:ListItem Value="3">Dissatisfied</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <asp:Label ID="lblComments" runat="server" Text="Please enter any additional comments:"></asp:Label>
                <br />
                <asp:TextBox ID="txtComments" runat="server" Height="70px" TextMode="MultiLine" Width="321px"></asp:TextBox>
                <br />
                <br />
                <asp:CheckBox ID="chbContact" runat="server" Text="Do you wish to be contacted? " TextAlign="Left" />
                <br />
                <br />
                <asp:Label ID="lblContactMethod" runat="server" Text="How do prefer to be contacted?"></asp:Label>
                <br />
                <asp:RadioButtonList ID="rblContactMethod" runat="server">
                    <asp:ListItem Selected="True" Value="Email">Email</asp:ListItem>
                    <asp:ListItem Value="Phone">Phone</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="feedback" />
                <br />
            </asp:Panel>
        </form>
    </section>
</body>
</html>