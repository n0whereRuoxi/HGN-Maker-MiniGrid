( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b472 - block
    b390 - block
    b800 - block
    b116 - block
    b425 - block
    b708 - block
    b593 - block
    b782 - block
    b785 - block
    b634 - block
    b192 - block
    b48 - block
    b330 - block
    b115 - block
    b710 - block
    b304 - block
    b179 - block
    b928 - block
    b774 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b472 )
    ( on b390 b472 )
    ( on b800 b390 )
    ( on b116 b800 )
    ( on b425 b116 )
    ( on b708 b425 )
    ( on b593 b708 )
    ( on b782 b593 )
    ( on b785 b782 )
    ( on b634 b785 )
    ( on b192 b634 )
    ( on b48 b192 )
    ( on b330 b48 )
    ( on b115 b330 )
    ( on b710 b115 )
    ( on b304 b710 )
    ( on b179 b304 )
    ( on b928 b179 )
    ( on b774 b928 )
    ( clear b774 )
  )
  ( :goal
    ( and
      ( clear b472 )
    )
  )
)
