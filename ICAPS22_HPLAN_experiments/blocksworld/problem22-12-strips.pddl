( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b214 - block
    b390 - block
    b728 - block
    b604 - block
    b213 - block
    b286 - block
    b80 - block
    b170 - block
    b413 - block
    b222 - block
    b972 - block
    b887 - block
    b922 - block
    b712 - block
    b783 - block
    b592 - block
    b475 - block
    b964 - block
    b225 - block
    b725 - block
    b234 - block
    b466 - block
    b187 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b214 )
    ( on b390 b214 )
    ( on b728 b390 )
    ( on b604 b728 )
    ( on b213 b604 )
    ( on b286 b213 )
    ( on b80 b286 )
    ( on b170 b80 )
    ( on b413 b170 )
    ( on b222 b413 )
    ( on b972 b222 )
    ( on b887 b972 )
    ( on b922 b887 )
    ( on b712 b922 )
    ( on b783 b712 )
    ( on b592 b783 )
    ( on b475 b592 )
    ( on b964 b475 )
    ( on b225 b964 )
    ( on b725 b225 )
    ( on b234 b725 )
    ( on b466 b234 )
    ( on b187 b466 )
    ( clear b187 )
  )
  ( :goal
    ( and
      ( clear b214 )
    )
  )
)
