@echo off
setlocal

REM =====================================================
REM AMD Vitis
REM =====================================================
call "F:\AMDDesignTools\2026.1\Vitis\settings64.bat"

REM =====================================================
REM LightningSim conda environment
REM =====================================================
call "C:\Users\USER\miniconda3\Scripts\activate.bat" lightningsim

echo.
echo ============================================
echo HLS4ML + Vitis + LightningSim environment
echo initialized successfully.
echo.
where vitis-run
where lightningsim
echo ============================================
echo.

cmd /k

endlocal