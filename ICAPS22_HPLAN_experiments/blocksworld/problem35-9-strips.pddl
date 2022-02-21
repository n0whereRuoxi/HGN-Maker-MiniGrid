( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b859 - block
    b616 - block
    b676 - block
    b892 - block
    b804 - block
    b754 - block
    b941 - block
    b875 - block
    b159 - block
    b454 - block
    b417 - block
    b584 - block
    b394 - block
    b431 - block
    b752 - block
    b855 - block
    b664 - block
    b309 - block
    b500 - block
    b784 - block
    b514 - block
    b839 - block
    b77 - block
    b395 - block
    b702 - block
    b230 - block
    b889 - block
    b944 - block
    b366 - block
    b999 - block
    b515 - block
    b881 - block
    b298 - block
    b645 - block
    b964 - block
    b401 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b859 )
    ( on b616 b859 )
    ( on b676 b616 )
    ( on b892 b676 )
    ( on b804 b892 )
    ( on b754 b804 )
    ( on b941 b754 )
    ( on b875 b941 )
    ( on b159 b875 )
    ( on b454 b159 )
    ( on b417 b454 )
    ( on b584 b417 )
    ( on b394 b584 )
    ( on b431 b394 )
    ( on b752 b431 )
    ( on b855 b752 )
    ( on b664 b855 )
    ( on b309 b664 )
    ( on b500 b309 )
    ( on b784 b500 )
    ( on b514 b784 )
    ( on b839 b514 )
    ( on b77 b839 )
    ( on b395 b77 )
    ( on b702 b395 )
    ( on b230 b702 )
    ( on b889 b230 )
    ( on b944 b889 )
    ( on b366 b944 )
    ( on b999 b366 )
    ( on b515 b999 )
    ( on b881 b515 )
    ( on b298 b881 )
    ( on b645 b298 )
    ( on b964 b645 )
    ( on b401 b964 )
    ( clear b401 )
  )
  ( :goal
    ( and
      ( clear b859 )
    )
  )
)
