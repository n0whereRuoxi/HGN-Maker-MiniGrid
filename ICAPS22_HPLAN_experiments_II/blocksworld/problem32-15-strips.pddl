( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b454 - block
    b574 - block
    b236 - block
    b90 - block
    b43 - block
    b885 - block
    b427 - block
    b766 - block
    b176 - block
    b614 - block
    b278 - block
    b31 - block
    b167 - block
    b82 - block
    b937 - block
    b975 - block
    b880 - block
    b228 - block
    b196 - block
    b780 - block
    b13 - block
    b758 - block
    b472 - block
    b274 - block
    b387 - block
    b827 - block
    b7 - block
    b157 - block
    b545 - block
    b719 - block
    b268 - block
    b792 - block
    b129 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b454 )
    ( on b574 b454 )
    ( on b236 b574 )
    ( on b90 b236 )
    ( on b43 b90 )
    ( on b885 b43 )
    ( on b427 b885 )
    ( on b766 b427 )
    ( on b176 b766 )
    ( on b614 b176 )
    ( on b278 b614 )
    ( on b31 b278 )
    ( on b167 b31 )
    ( on b82 b167 )
    ( on b937 b82 )
    ( on b975 b937 )
    ( on b880 b975 )
    ( on b228 b880 )
    ( on b196 b228 )
    ( on b780 b196 )
    ( on b13 b780 )
    ( on b758 b13 )
    ( on b472 b758 )
    ( on b274 b472 )
    ( on b387 b274 )
    ( on b827 b387 )
    ( on b7 b827 )
    ( on b157 b7 )
    ( on b545 b157 )
    ( on b719 b545 )
    ( on b268 b719 )
    ( on b792 b268 )
    ( on b129 b792 )
    ( clear b129 )
  )
  ( :goal
    ( and
      ( clear b454 )
    )
  )
)
