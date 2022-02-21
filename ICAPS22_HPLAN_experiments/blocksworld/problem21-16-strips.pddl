( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b863 - block
    b44 - block
    b802 - block
    b904 - block
    b588 - block
    b727 - block
    b423 - block
    b876 - block
    b917 - block
    b611 - block
    b391 - block
    b981 - block
    b229 - block
    b815 - block
    b356 - block
    b159 - block
    b828 - block
    b92 - block
    b732 - block
    b515 - block
    b789 - block
    b104 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b863 )
    ( on b44 b863 )
    ( on b802 b44 )
    ( on b904 b802 )
    ( on b588 b904 )
    ( on b727 b588 )
    ( on b423 b727 )
    ( on b876 b423 )
    ( on b917 b876 )
    ( on b611 b917 )
    ( on b391 b611 )
    ( on b981 b391 )
    ( on b229 b981 )
    ( on b815 b229 )
    ( on b356 b815 )
    ( on b159 b356 )
    ( on b828 b159 )
    ( on b92 b828 )
    ( on b732 b92 )
    ( on b515 b732 )
    ( on b789 b515 )
    ( on b104 b789 )
    ( clear b104 )
  )
  ( :goal
    ( and
      ( clear b863 )
    )
  )
)
