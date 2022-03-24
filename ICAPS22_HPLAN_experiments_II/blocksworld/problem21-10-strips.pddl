( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b493 - block
    b430 - block
    b217 - block
    b985 - block
    b196 - block
    b268 - block
    b442 - block
    b953 - block
    b113 - block
    b171 - block
    b305 - block
    b323 - block
    b94 - block
    b823 - block
    b631 - block
    b197 - block
    b770 - block
    b593 - block
    b307 - block
    b940 - block
    b781 - block
    b193 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b493 )
    ( on b430 b493 )
    ( on b217 b430 )
    ( on b985 b217 )
    ( on b196 b985 )
    ( on b268 b196 )
    ( on b442 b268 )
    ( on b953 b442 )
    ( on b113 b953 )
    ( on b171 b113 )
    ( on b305 b171 )
    ( on b323 b305 )
    ( on b94 b323 )
    ( on b823 b94 )
    ( on b631 b823 )
    ( on b197 b631 )
    ( on b770 b197 )
    ( on b593 b770 )
    ( on b307 b593 )
    ( on b940 b307 )
    ( on b781 b940 )
    ( on b193 b781 )
    ( clear b193 )
  )
  ( :goal
    ( and
      ( clear b493 )
    )
  )
)
