( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b627 - block
    b200 - block
    b995 - block
    b800 - block
    b516 - block
    b235 - block
    b400 - block
    b959 - block
    b761 - block
    b349 - block
    b628 - block
    b350 - block
    b124 - block
    b14 - block
    b741 - block
    b921 - block
    b817 - block
    b708 - block
    b902 - block
    b309 - block
    b180 - block
    b865 - block
    b336 - block
    b812 - block
    b764 - block
    b173 - block
    b364 - block
    b576 - block
    b209 - block
    b590 - block
    b568 - block
    b920 - block
    b992 - block
    b858 - block
    b664 - block
    b11 - block
    b826 - block
    b980 - block
    b68 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b627 )
    ( on b200 b627 )
    ( on b995 b200 )
    ( on b800 b995 )
    ( on b516 b800 )
    ( on b235 b516 )
    ( on b400 b235 )
    ( on b959 b400 )
    ( on b761 b959 )
    ( on b349 b761 )
    ( on b628 b349 )
    ( on b350 b628 )
    ( on b124 b350 )
    ( on b14 b124 )
    ( on b741 b14 )
    ( on b921 b741 )
    ( on b817 b921 )
    ( on b708 b817 )
    ( on b902 b708 )
    ( on b309 b902 )
    ( on b180 b309 )
    ( on b865 b180 )
    ( on b336 b865 )
    ( on b812 b336 )
    ( on b764 b812 )
    ( on b173 b764 )
    ( on b364 b173 )
    ( on b576 b364 )
    ( on b209 b576 )
    ( on b590 b209 )
    ( on b568 b590 )
    ( on b920 b568 )
    ( on b992 b920 )
    ( on b858 b992 )
    ( on b664 b858 )
    ( on b11 b664 )
    ( on b826 b11 )
    ( on b980 b826 )
    ( on b68 b980 )
    ( clear b68 )
  )
  ( :goal
    ( and
      ( clear b627 )
    )
  )
)
