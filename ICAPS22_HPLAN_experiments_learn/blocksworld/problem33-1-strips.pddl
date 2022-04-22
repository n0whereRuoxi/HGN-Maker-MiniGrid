( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b770 - block
    b372 - block
    b721 - block
    b710 - block
    b461 - block
    b600 - block
    b619 - block
    b169 - block
    b283 - block
    b724 - block
    b713 - block
    b951 - block
    b447 - block
    b386 - block
    b149 - block
    b834 - block
    b873 - block
    b436 - block
    b991 - block
    b311 - block
    b964 - block
    b141 - block
    b144 - block
    b51 - block
    b432 - block
    b415 - block
    b894 - block
    b763 - block
    b466 - block
    b880 - block
    b732 - block
    b339 - block
    b510 - block
    b438 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b770 )
    ( on b372 b770 )
    ( on b721 b372 )
    ( on b710 b721 )
    ( on b461 b710 )
    ( on b600 b461 )
    ( on b619 b600 )
    ( on b169 b619 )
    ( on b283 b169 )
    ( on b724 b283 )
    ( on b713 b724 )
    ( on b951 b713 )
    ( on b447 b951 )
    ( on b386 b447 )
    ( on b149 b386 )
    ( on b834 b149 )
    ( on b873 b834 )
    ( on b436 b873 )
    ( on b991 b436 )
    ( on b311 b991 )
    ( on b964 b311 )
    ( on b141 b964 )
    ( on b144 b141 )
    ( on b51 b144 )
    ( on b432 b51 )
    ( on b415 b432 )
    ( on b894 b415 )
    ( on b763 b894 )
    ( on b466 b763 )
    ( on b880 b466 )
    ( on b732 b880 )
    ( on b339 b732 )
    ( on b510 b339 )
    ( on b438 b510 )
    ( clear b438 )
  )
  ( :goal
    ( and
      ( clear b770 )
    )
  )
)
