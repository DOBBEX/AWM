if (guna2CustomCheckBox4.Checked)
{
    string search = "40 cd cc 8c 3f 8f c2 f5 3c cd cc cc 3d 07 00 00 00 00 00 00 00 00 00 00 00 00 00 f0 41 00 00 48 42 00 00 00 3f 33 33 13 40 00 00 b0 3f 00 00 80 3f 01 00 00";
    string replace = "40 e0 b1 ff ff e0 b1 ff ff e0 b1 ff ff e0 b1 ff ff e0 b1 ff ff 00 00 00 00 00 00 f0 41 00 00 48 42 00 00 00 3f 33 33 13 40 00 00 b0 3f 00 00 80 3f 01 00 00";


    bool k = false;

    if (Process.GetProcessesByName("HD-Player").Length == 0)
    {
        // error
        guna2HtmlLabel1.Text = "OPEN YOUR EMULATOR";
    }
    else
    {
        DOBBEX.OpenProcess("HD-Player");
        // Applying
        guna2HtmlLabel1.Text = "හැකියාව ACTIVATING...";
        int i2 = 22000000;
        IEnumerable<long> wl = await DOBBEX.AoBScan(search, writable: true);

        string u = "0x" + wl.FirstOrDefault().ToString("X");
        if (wl.Count() != 0)
        {
            for (int i = 0; i < wl.Count(); i++)
            {
                i2++;
                DOBBEX.WriteMemory(wl.ElementAt(i).ToString("X"), "bytes", replace);
            }
            k = true;
        }

        if (k)
        {
            // Applied
            guna2HtmlLabel1.Text = "හැකියාව APPLIED";
            Console.Beep(500, 300);
        }
        else
        {
            // error
            guna2HtmlLabel1.Text = "ERROR";
        }
    }
}