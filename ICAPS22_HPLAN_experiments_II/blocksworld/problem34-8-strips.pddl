( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b622 - block
    b607 - block
    b911 - block
    b878 - block
    b649 - block
    b194 - block
    b849 - block
    b809 - block
    b135 - block
    b165 - block
    b801 - block
    b861 - block
    b918 - block
    b786 - block
    b966 - block
    b196 - block
    b29 - block
    b578 - block
    b97 - block
    b92 - block
    b506 - block
    b587 - block
    b707 - block
    b642 - block
    b47 - block
    b799 - block
    b798 - block
    b368 - block
    b468 - block
    b407 - block
    b472 - block
    b441 - block
    b738 - block
    b33 - block
    b416 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b622 )
    ( on b607 b622 )
    ( on b911 b607 )
    ( on b878 b911 )
    ( on b649 b878 )
    ( on b194 b649 )
    ( on b849 b194 )
    ( on b809 b849 )
    ( on b135 b809 )
    ( on b165 b135 )
    ( on b801 b165 )
    ( on b861 b801 )
    ( on b918 b861 )
    ( on b786 b918 )
    ( on b966 b786 )
    ( on b196 b966 )
    ( on b29 b196 )
    ( on b578 b29 )
    ( on b97 b578 )
    ( on b92 b97 )
    ( on b506 b92 )
    ( on b587 b506 )
    ( on b707 b587 )
    ( on b642 b707 )
    ( on b47 b642 )
    ( on b799 b47 )
    ( on b798 b799 )
    ( on b368 b798 )
    ( on b468 b368 )
    ( on b407 b468 )
    ( on b472 b407 )
    ( on b441 b472 )
    ( on b738 b441 )
    ( on b33 b738 )
    ( on b416 b33 )
    ( clear b416 )
  )
  ( :goal
    ( and
      ( clear b622 )
    )
  )
)
