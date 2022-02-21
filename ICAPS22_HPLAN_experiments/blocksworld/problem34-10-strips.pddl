( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b563 - block
    b406 - block
    b588 - block
    b662 - block
    b748 - block
    b301 - block
    b798 - block
    b414 - block
    b149 - block
    b393 - block
    b366 - block
    b448 - block
    b526 - block
    b160 - block
    b684 - block
    b242 - block
    b340 - block
    b679 - block
    b532 - block
    b824 - block
    b852 - block
    b364 - block
    b570 - block
    b262 - block
    b589 - block
    b934 - block
    b938 - block
    b937 - block
    b119 - block
    b623 - block
    b592 - block
    b525 - block
    b586 - block
    b796 - block
    b604 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b563 )
    ( on b406 b563 )
    ( on b588 b406 )
    ( on b662 b588 )
    ( on b748 b662 )
    ( on b301 b748 )
    ( on b798 b301 )
    ( on b414 b798 )
    ( on b149 b414 )
    ( on b393 b149 )
    ( on b366 b393 )
    ( on b448 b366 )
    ( on b526 b448 )
    ( on b160 b526 )
    ( on b684 b160 )
    ( on b242 b684 )
    ( on b340 b242 )
    ( on b679 b340 )
    ( on b532 b679 )
    ( on b824 b532 )
    ( on b852 b824 )
    ( on b364 b852 )
    ( on b570 b364 )
    ( on b262 b570 )
    ( on b589 b262 )
    ( on b934 b589 )
    ( on b938 b934 )
    ( on b937 b938 )
    ( on b119 b937 )
    ( on b623 b119 )
    ( on b592 b623 )
    ( on b525 b592 )
    ( on b586 b525 )
    ( on b796 b586 )
    ( on b604 b796 )
    ( clear b604 )
  )
  ( :goal
    ( and
      ( clear b563 )
    )
  )
)
