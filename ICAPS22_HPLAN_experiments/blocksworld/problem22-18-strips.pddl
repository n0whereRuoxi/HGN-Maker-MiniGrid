( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b232 - block
    b696 - block
    b980 - block
    b272 - block
    b993 - block
    b757 - block
    b682 - block
    b140 - block
    b608 - block
    b548 - block
    b887 - block
    b931 - block
    b189 - block
    b144 - block
    b28 - block
    b862 - block
    b292 - block
    b716 - block
    b752 - block
    b303 - block
    b259 - block
    b792 - block
    b526 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b232 )
    ( on b696 b232 )
    ( on b980 b696 )
    ( on b272 b980 )
    ( on b993 b272 )
    ( on b757 b993 )
    ( on b682 b757 )
    ( on b140 b682 )
    ( on b608 b140 )
    ( on b548 b608 )
    ( on b887 b548 )
    ( on b931 b887 )
    ( on b189 b931 )
    ( on b144 b189 )
    ( on b28 b144 )
    ( on b862 b28 )
    ( on b292 b862 )
    ( on b716 b292 )
    ( on b752 b716 )
    ( on b303 b752 )
    ( on b259 b303 )
    ( on b792 b259 )
    ( on b526 b792 )
    ( clear b526 )
  )
  ( :goal
    ( and
      ( clear b232 )
    )
  )
)
