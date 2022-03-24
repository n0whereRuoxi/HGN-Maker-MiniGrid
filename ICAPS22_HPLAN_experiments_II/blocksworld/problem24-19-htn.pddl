( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b337 - block
    b142 - block
    b4 - block
    b542 - block
    b659 - block
    b193 - block
    b549 - block
    b723 - block
    b579 - block
    b187 - block
    b492 - block
    b915 - block
    b663 - block
    b565 - block
    b382 - block
    b87 - block
    b110 - block
    b88 - block
    b242 - block
    b947 - block
    b60 - block
    b535 - block
    b508 - block
    b733 - block
    b731 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b337 )
    ( on b142 b337 )
    ( on b4 b142 )
    ( on b542 b4 )
    ( on b659 b542 )
    ( on b193 b659 )
    ( on b549 b193 )
    ( on b723 b549 )
    ( on b579 b723 )
    ( on b187 b579 )
    ( on b492 b187 )
    ( on b915 b492 )
    ( on b663 b915 )
    ( on b565 b663 )
    ( on b382 b565 )
    ( on b87 b382 )
    ( on b110 b87 )
    ( on b88 b110 )
    ( on b242 b88 )
    ( on b947 b242 )
    ( on b60 b947 )
    ( on b535 b60 )
    ( on b508 b535 )
    ( on b733 b508 )
    ( on b731 b733 )
    ( clear b731 )
  )
  ( :tasks
    ( Make-24Pile b142 b4 b542 b659 b193 b549 b723 b579 b187 b492 b915 b663 b565 b382 b87 b110 b88 b242 b947 b60 b535 b508 b733 b731 )
  )
)
