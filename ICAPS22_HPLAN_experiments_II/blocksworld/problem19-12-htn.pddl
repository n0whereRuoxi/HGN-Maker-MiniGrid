( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b226 - block
    b211 - block
    b406 - block
    b752 - block
    b671 - block
    b445 - block
    b339 - block
    b294 - block
    b183 - block
    b766 - block
    b75 - block
    b424 - block
    b478 - block
    b565 - block
    b590 - block
    b126 - block
    b215 - block
    b924 - block
    b707 - block
    b658 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b226 )
    ( on b211 b226 )
    ( on b406 b211 )
    ( on b752 b406 )
    ( on b671 b752 )
    ( on b445 b671 )
    ( on b339 b445 )
    ( on b294 b339 )
    ( on b183 b294 )
    ( on b766 b183 )
    ( on b75 b766 )
    ( on b424 b75 )
    ( on b478 b424 )
    ( on b565 b478 )
    ( on b590 b565 )
    ( on b126 b590 )
    ( on b215 b126 )
    ( on b924 b215 )
    ( on b707 b924 )
    ( on b658 b707 )
    ( clear b658 )
  )
  ( :tasks
    ( Make-19Pile b211 b406 b752 b671 b445 b339 b294 b183 b766 b75 b424 b478 b565 b590 b126 b215 b924 b707 b658 )
  )
)
