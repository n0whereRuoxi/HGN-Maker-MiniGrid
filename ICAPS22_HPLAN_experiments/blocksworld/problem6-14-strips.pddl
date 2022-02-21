( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b648 - block
    b834 - block
    b710 - block
    b38 - block
    b607 - block
    b200 - block
    b951 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b648 )
    ( on b834 b648 )
    ( on b710 b834 )
    ( on b38 b710 )
    ( on b607 b38 )
    ( on b200 b607 )
    ( on b951 b200 )
    ( clear b951 )
  )
  ( :goal
    ( and
      ( clear b648 )
      ( clear b648 )
      ( clear b648 )
      ( clear b648 )
      ( clear b648 )
      ( clear b648 )
      ( clear b648 )
    )
  )
)
