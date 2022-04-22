( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b481 - block
    b185 - block
    b242 - block
    b480 - block
    b594 - block
    b680 - block
    b241 - block
    b471 - block
    b539 - block
    b986 - block
    b937 - block
    b557 - block
    b150 - block
    b779 - block
    b478 - block
    b73 - block
    b212 - block
    b583 - block
    b870 - block
    b955 - block
    b644 - block
    b563 - block
    b244 - block
    b514 - block
    b778 - block
    b164 - block
    b3 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b481 )
    ( on b185 b481 )
    ( on b242 b185 )
    ( on b480 b242 )
    ( on b594 b480 )
    ( on b680 b594 )
    ( on b241 b680 )
    ( on b471 b241 )
    ( on b539 b471 )
    ( on b986 b539 )
    ( on b937 b986 )
    ( on b557 b937 )
    ( on b150 b557 )
    ( on b779 b150 )
    ( on b478 b779 )
    ( on b73 b478 )
    ( on b212 b73 )
    ( on b583 b212 )
    ( on b870 b583 )
    ( on b955 b870 )
    ( on b644 b955 )
    ( on b563 b644 )
    ( on b244 b563 )
    ( on b514 b244 )
    ( on b778 b514 )
    ( on b164 b778 )
    ( on b3 b164 )
    ( clear b3 )
  )
  ( :goal
    ( and
      ( clear b481 )
    )
  )
)
