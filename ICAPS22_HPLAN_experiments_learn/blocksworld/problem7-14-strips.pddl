( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b64 - block
    b6 - block
    b534 - block
    b98 - block
    b592 - block
    b585 - block
    b917 - block
    b397 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b64 )
    ( on b6 b64 )
    ( on b534 b6 )
    ( on b98 b534 )
    ( on b592 b98 )
    ( on b585 b592 )
    ( on b917 b585 )
    ( on b397 b917 )
    ( clear b397 )
  )
  ( :goal
    ( and
      ( clear b64 )
    )
  )
)
