( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b553 - block
    b630 - block
    b816 - block
    b524 - block
    b760 - block
    b409 - block
    b462 - block
    b912 - block
    b597 - block
    b635 - block
    b256 - block
    b433 - block
    b14 - block
    b313 - block
    b110 - block
    b76 - block
    b897 - block
    b120 - block
    b150 - block
    b107 - block
    b567 - block
    b239 - block
    b660 - block
    b130 - block
    b640 - block
    b819 - block
    b930 - block
    b237 - block
    b874 - block
    b850 - block
    b50 - block
    b668 - block
    b81 - block
    b993 - block
    b249 - block
    b670 - block
    b619 - block
    b325 - block
    b257 - block
    b367 - block
    b243 - block
    b808 - block
    b905 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b553 )
    ( on b630 b553 )
    ( on b816 b630 )
    ( on b524 b816 )
    ( on b760 b524 )
    ( on b409 b760 )
    ( on b462 b409 )
    ( on b912 b462 )
    ( on b597 b912 )
    ( on b635 b597 )
    ( on b256 b635 )
    ( on b433 b256 )
    ( on b14 b433 )
    ( on b313 b14 )
    ( on b110 b313 )
    ( on b76 b110 )
    ( on b897 b76 )
    ( on b120 b897 )
    ( on b150 b120 )
    ( on b107 b150 )
    ( on b567 b107 )
    ( on b239 b567 )
    ( on b660 b239 )
    ( on b130 b660 )
    ( on b640 b130 )
    ( on b819 b640 )
    ( on b930 b819 )
    ( on b237 b930 )
    ( on b874 b237 )
    ( on b850 b874 )
    ( on b50 b850 )
    ( on b668 b50 )
    ( on b81 b668 )
    ( on b993 b81 )
    ( on b249 b993 )
    ( on b670 b249 )
    ( on b619 b670 )
    ( on b325 b619 )
    ( on b257 b325 )
    ( on b367 b257 )
    ( on b243 b367 )
    ( on b808 b243 )
    ( on b905 b808 )
    ( clear b905 )
  )
  ( :goal
    ( and
      ( clear b553 )
    )
  )
)
