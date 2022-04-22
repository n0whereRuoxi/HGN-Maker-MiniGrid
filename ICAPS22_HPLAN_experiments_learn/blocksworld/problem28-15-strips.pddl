( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b720 - block
    b607 - block
    b929 - block
    b664 - block
    b621 - block
    b373 - block
    b327 - block
    b365 - block
    b974 - block
    b350 - block
    b42 - block
    b808 - block
    b84 - block
    b875 - block
    b384 - block
    b189 - block
    b129 - block
    b49 - block
    b963 - block
    b885 - block
    b993 - block
    b91 - block
    b63 - block
    b335 - block
    b643 - block
    b840 - block
    b915 - block
    b817 - block
    b798 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b720 )
    ( on b607 b720 )
    ( on b929 b607 )
    ( on b664 b929 )
    ( on b621 b664 )
    ( on b373 b621 )
    ( on b327 b373 )
    ( on b365 b327 )
    ( on b974 b365 )
    ( on b350 b974 )
    ( on b42 b350 )
    ( on b808 b42 )
    ( on b84 b808 )
    ( on b875 b84 )
    ( on b384 b875 )
    ( on b189 b384 )
    ( on b129 b189 )
    ( on b49 b129 )
    ( on b963 b49 )
    ( on b885 b963 )
    ( on b993 b885 )
    ( on b91 b993 )
    ( on b63 b91 )
    ( on b335 b63 )
    ( on b643 b335 )
    ( on b840 b643 )
    ( on b915 b840 )
    ( on b817 b915 )
    ( on b798 b817 )
    ( clear b798 )
  )
  ( :goal
    ( and
      ( clear b720 )
    )
  )
)
