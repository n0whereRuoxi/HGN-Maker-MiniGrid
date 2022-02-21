( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b833 - block
    b955 - block
    b43 - block
    b951 - block
    b985 - block
    b912 - block
    b862 - block
    b867 - block
    b496 - block
    b593 - block
    b385 - block
    b1 - block
    b237 - block
    b314 - block
    b22 - block
    b648 - block
    b282 - block
    b819 - block
    b719 - block
    b590 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b833 )
    ( on b955 b833 )
    ( on b43 b955 )
    ( on b951 b43 )
    ( on b985 b951 )
    ( on b912 b985 )
    ( on b862 b912 )
    ( on b867 b862 )
    ( on b496 b867 )
    ( on b593 b496 )
    ( on b385 b593 )
    ( on b1 b385 )
    ( on b237 b1 )
    ( on b314 b237 )
    ( on b22 b314 )
    ( on b648 b22 )
    ( on b282 b648 )
    ( on b819 b282 )
    ( on b719 b819 )
    ( on b590 b719 )
    ( clear b590 )
  )
  ( :goal
    ( and
      ( clear b833 )
    )
  )
)
