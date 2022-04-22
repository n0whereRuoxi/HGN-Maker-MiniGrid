( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b587 - block
    b443 - block
    b926 - block
    b994 - block
    b315 - block
    b781 - block
    b860 - block
    b27 - block
    b697 - block
    b732 - block
    b257 - block
    b829 - block
    b964 - block
    b350 - block
    b780 - block
    b24 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b587 )
    ( on b443 b587 )
    ( on b926 b443 )
    ( on b994 b926 )
    ( on b315 b994 )
    ( on b781 b315 )
    ( on b860 b781 )
    ( on b27 b860 )
    ( on b697 b27 )
    ( on b732 b697 )
    ( on b257 b732 )
    ( on b829 b257 )
    ( on b964 b829 )
    ( on b350 b964 )
    ( on b780 b350 )
    ( on b24 b780 )
    ( clear b24 )
  )
  ( :goal
    ( and
      ( clear b587 )
    )
  )
)
