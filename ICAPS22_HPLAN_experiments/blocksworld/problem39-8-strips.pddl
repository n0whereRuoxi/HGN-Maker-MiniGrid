( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b384 - block
    b725 - block
    b193 - block
    b56 - block
    b776 - block
    b499 - block
    b99 - block
    b854 - block
    b397 - block
    b933 - block
    b133 - block
    b2 - block
    b132 - block
    b729 - block
    b893 - block
    b903 - block
    b535 - block
    b472 - block
    b69 - block
    b511 - block
    b154 - block
    b504 - block
    b822 - block
    b890 - block
    b419 - block
    b288 - block
    b939 - block
    b102 - block
    b453 - block
    b823 - block
    b495 - block
    b334 - block
    b200 - block
    b633 - block
    b678 - block
    b34 - block
    b420 - block
    b75 - block
    b553 - block
    b637 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b384 )
    ( on b725 b384 )
    ( on b193 b725 )
    ( on b56 b193 )
    ( on b776 b56 )
    ( on b499 b776 )
    ( on b99 b499 )
    ( on b854 b99 )
    ( on b397 b854 )
    ( on b933 b397 )
    ( on b133 b933 )
    ( on b2 b133 )
    ( on b132 b2 )
    ( on b729 b132 )
    ( on b893 b729 )
    ( on b903 b893 )
    ( on b535 b903 )
    ( on b472 b535 )
    ( on b69 b472 )
    ( on b511 b69 )
    ( on b154 b511 )
    ( on b504 b154 )
    ( on b822 b504 )
    ( on b890 b822 )
    ( on b419 b890 )
    ( on b288 b419 )
    ( on b939 b288 )
    ( on b102 b939 )
    ( on b453 b102 )
    ( on b823 b453 )
    ( on b495 b823 )
    ( on b334 b495 )
    ( on b200 b334 )
    ( on b633 b200 )
    ( on b678 b633 )
    ( on b34 b678 )
    ( on b420 b34 )
    ( on b75 b420 )
    ( on b553 b75 )
    ( on b637 b553 )
    ( clear b637 )
  )
  ( :goal
    ( and
      ( clear b384 )
    )
  )
)
