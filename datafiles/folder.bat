@echo off
setlocal enabledelayedexpansion
set count=1
for %%F in (*) do (
  mkdir "level !count!"
  move "%%F" "level !count!"
  set /a count+=1
)
