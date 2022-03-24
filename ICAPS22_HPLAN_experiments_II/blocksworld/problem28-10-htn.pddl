( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b189 - block
    b735 - block
    b549 - block
    b118 - block
    b703 - block
    b256 - block
    b574 - block
    b715 - block
    b361 - block
    b174 - block
    b543 - block
    b595 - block
    b950 - block
    b419 - block
    b373 - block
    b800 - block
    b502 - block
    b312 - block
    b234 - block
    b897 - block
    b771 - block
    b250 - block
    b20 - block
    b447 - block
    b570 - block
    b562 - block
    b86 - block
    b770 - block
    b644 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b189 )
    ( on b735 b189 )
    ( on b549 b735 )
    ( on b118 b549 )
    ( on b703 b118 )
    ( on b256 b703 )
    ( on b574 b256 )
    ( on b715 b574 )
    ( on b361 b715 )
    ( on b174 b361 )
    ( on b543 b174 )
    ( on b595 b543 )
    ( on b950 b595 )
    ( on b419 b950 )
    ( on b373 b419 )
    ( on b800 b373 )
    ( on b502 b800 )
    ( on b312 b502 )
    ( on b234 b312 )
    ( on b897 b234 )
    ( on b771 b897 )
    ( on b250 b771 )
    ( on b20 b250 )
    ( on b447 b20 )
    ( on b570 b447 )
    ( on b562 b570 )
    ( on b86 b562 )
    ( on b770 b86 )
    ( on b644 b770 )
    ( clear b644 )
  )
  ( :tasks
    ( Make-28Pile b735 b549 b118 b703 b256 b574 b715 b361 b174 b543 b595 b950 b419 b373 b800 b502 b312 b234 b897 b771 b250 b20 b447 b570 b562 b86 b770 b644 )
  )
)
