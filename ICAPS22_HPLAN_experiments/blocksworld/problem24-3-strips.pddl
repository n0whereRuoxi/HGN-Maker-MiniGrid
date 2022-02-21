( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b284 - block
    b822 - block
    b992 - block
    b952 - block
    b913 - block
    b851 - block
    b810 - block
    b330 - block
    b85 - block
    b734 - block
    b847 - block
    b506 - block
    b554 - block
    b959 - block
    b980 - block
    b711 - block
    b640 - block
    b870 - block
    b348 - block
    b229 - block
    b269 - block
    b415 - block
    b46 - block
    b380 - block
    b916 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b284 )
    ( on b822 b284 )
    ( on b992 b822 )
    ( on b952 b992 )
    ( on b913 b952 )
    ( on b851 b913 )
    ( on b810 b851 )
    ( on b330 b810 )
    ( on b85 b330 )
    ( on b734 b85 )
    ( on b847 b734 )
    ( on b506 b847 )
    ( on b554 b506 )
    ( on b959 b554 )
    ( on b980 b959 )
    ( on b711 b980 )
    ( on b640 b711 )
    ( on b870 b640 )
    ( on b348 b870 )
    ( on b229 b348 )
    ( on b269 b229 )
    ( on b415 b269 )
    ( on b46 b415 )
    ( on b380 b46 )
    ( on b916 b380 )
    ( clear b916 )
  )
  ( :goal
    ( and
      ( clear b284 )
    )
  )
)
