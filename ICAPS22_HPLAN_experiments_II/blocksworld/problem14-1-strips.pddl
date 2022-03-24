( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b275 - block
    b923 - block
    b416 - block
    b48 - block
    b69 - block
    b896 - block
    b601 - block
    b884 - block
    b185 - block
    b866 - block
    b481 - block
    b125 - block
    b614 - block
    b17 - block
    b50 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b275 )
    ( on b923 b275 )
    ( on b416 b923 )
    ( on b48 b416 )
    ( on b69 b48 )
    ( on b896 b69 )
    ( on b601 b896 )
    ( on b884 b601 )
    ( on b185 b884 )
    ( on b866 b185 )
    ( on b481 b866 )
    ( on b125 b481 )
    ( on b614 b125 )
    ( on b17 b614 )
    ( on b50 b17 )
    ( clear b50 )
  )
  ( :goal
    ( and
      ( clear b275 )
    )
  )
)
