( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b733 - block
    b184 - block
    b64 - block
    b8 - block
    b622 - block
    b558 - block
    b911 - block
    b538 - block
    b114 - block
    b716 - block
    b266 - block
    b492 - block
    b309 - block
    b858 - block
    b951 - block
    b432 - block
    b147 - block
    b637 - block
    b179 - block
    b862 - block
    b84 - block
    b411 - block
    b788 - block
    b688 - block
    b156 - block
    b900 - block
    b164 - block
    b368 - block
    b207 - block
    b42 - block
    b176 - block
    b109 - block
    b518 - block
    b642 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b733 )
    ( on b184 b733 )
    ( on b64 b184 )
    ( on b8 b64 )
    ( on b622 b8 )
    ( on b558 b622 )
    ( on b911 b558 )
    ( on b538 b911 )
    ( on b114 b538 )
    ( on b716 b114 )
    ( on b266 b716 )
    ( on b492 b266 )
    ( on b309 b492 )
    ( on b858 b309 )
    ( on b951 b858 )
    ( on b432 b951 )
    ( on b147 b432 )
    ( on b637 b147 )
    ( on b179 b637 )
    ( on b862 b179 )
    ( on b84 b862 )
    ( on b411 b84 )
    ( on b788 b411 )
    ( on b688 b788 )
    ( on b156 b688 )
    ( on b900 b156 )
    ( on b164 b900 )
    ( on b368 b164 )
    ( on b207 b368 )
    ( on b42 b207 )
    ( on b176 b42 )
    ( on b109 b176 )
    ( on b518 b109 )
    ( on b642 b518 )
    ( clear b642 )
  )
  ( :goal
    ( and
      ( clear b733 )
    )
  )
)
