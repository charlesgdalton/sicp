;;exercise 2.49-completed!

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
	((frame-coord-map frame)
	 (start-segment segment))
	((frame-coord-map frame)
	 (end-segment segment))))
     segment-list)))

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (frame-origin frame)
  (car frame))
(define (frame-edge1 frame)
  (cadr frame))
(define (frame-edge2 frame)
  (cddr frame))

(define (make-vect x y)
  (list x y))
(define (xcor-vect v)
  (car v))
(define (ycor-vect v)
  (cadr v))


(define (manipulate-vect f)
  (lambda (v1 v2)
    (make-vect
     (f (xcor-vect v1) (xcor-vect v2))
     (f (ycor-vect v1) (ycor-vect v2)))))

(define add-vect (manipulate-vect +))
(define sub-vect (manipulate-vect -))

(define (scale-vect v s)
  (make-vect
   (* s (xcor-vect v))
   (* s (ycor-vect v))))
(define (make-segment v1 v2)
  (list v1 v2))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cadr s))

(define (bottom-left frame)
  (frame-origin frame))
(define (botom-right frame)
  (add-vect (frame-origin frame) (frame-edge1 frame)))
(define (top-left frame)
  (add-vect (frame-origin frame) (frame-edge2 frame)))
(define (top-right frame)
  (add-vect (frame-origin frame) (add-vect (frame-edge1 frame) (frame-edge2 frame))))


(define (outline-painter frame)
  (let ((base (make-segment (bottom-left frame) (bottom-right frame)))
	(right (make-segment (bottom-right frame) (top-right frame)))
	(top (make-segment (top-left frame) (top-right frame)))
	(left (make-segment (bottom-left frame) (top-left frame))))
    ((segments->painter (list base right top left)) frame)))

(define (x-painter frame)
  (let ((bottom-left-to-top-right (make-segment (bottom-left frame) (top-right frame)))
	(bottom-right-to-top-left (make-segment (bottom-right frame) (top-left frame))))
    ((segments->painter (list bottom-left-to-top-right bottom-right-to-top-left)) frame)))


(define (diamond-painter frame)
  (let ((base-point (scale-vect (add-vect (bottom-left frame) (bottom-right frame)) .5))
	(right-point (scale-vect (add-vect (bottom-right frame) (top-right frame)) .5))
	(top-point (scale-vect (add-vect (top-left frame) (top-right frame)) .5))
	(left-point (scale-vect (add-vect (bottom-left frame) (top-left frame)) .5)))
    (let ((base-to-right (make-segment base-point right-point))
	  (right-to-top (make-segment right-point top-point))
	  (top-to-left (make-segment top-point left-point))
	  (left-to-base (make-segment left-point base-point)))
      ((segments->painter (list base-to-right right-to-top top-to-left left-to-base)) frame))))

;;I'm not doing the wave problem. That's
