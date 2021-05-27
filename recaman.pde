import java.util.ArrayList;
class Recaman
{
    int largest=0;
    int range;
    Recaman(int range_)
    {
      range=range_;
    }
    ArrayList<Integer>series=new ArrayList<Integer>();
    void evaluate()
    {
        series.add(0);
        int i=0;
        for(int hop=1;hop<range;hop++)
        {
            if(i-hop<0)
            {
                i+=hop;
                series.add(i);
            }
            else
            {
                if(!series.contains(i-hop))
                {
                    i-=hop;
                    series.add(i);
                }
                else
                {
                    i+=hop;
                    series.add(i);
                }
            }
            largest=largest<i?i:largest;
        }
    }
    
}
