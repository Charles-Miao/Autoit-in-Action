set fso=CreateObject("Scripting.FileSystemObject")
set ws=CreateObject("wscript.shell")
set fd=fso.getfolder("D:\IIS Log\W3SVC245654332")
for each f in fd.files
if datediff("h",f.Datecreated,now)>6 then
f.delete(true)
end if
next